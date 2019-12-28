part of '../../server.dart';

/// RCON Protocol
class RconSocket extends BaseSocket<Socket> {
  static const _SERVERDATA_AUTH = 3;
  static const _SERVERDATA_EXECCOMMAND = 2;
  static const _SERVERDATA_AUTH_RESPONSE = 2;
  static const _SERVERDATA_RESPONSE_VALUE = 0;

  final String password;

  int _packetId = 0;

  final _queue = Queue<Completer<String>>();
  final Logger _log = Logger('Rcon');

  RconSocket(address, port, this.password) : super(address, port);

  @override
  Future<void> connect() async {
    _socket = await Socket.connect(address, port);
    _socket.listen(_onData, onDone: _onDone);
    if ((await _authenticate(password)) == null) {
      throw RconException(
          'Authentication failed!', RconError.authenticationFailed);
    }
  }

  void _onDone() {
    _socket = null;
  }

  Future<void> _onData(List<int> data) async {
    _log.log(Level.FINEST, 'Recived data: $data');

    var bdata = ByteData.view(Int8List.fromList(data).buffer);
    var packetId = bdata.getInt32(4, Endian.little);
    var packetType = bdata.getInt32(8, Endian.little);

    switch (packetType) {
      case _SERVERDATA_AUTH_RESPONSE:
        {
          _log.log(Level.FINE,
              'Parsed AuthResponse - ID: $packetId, type: $packetType');
          if (packetId == -1) {
            _queue.removeFirst().complete(null);
            break;
          }
          _queue.removeFirst().complete('');
          break;
        }
      case _SERVERDATA_RESPONSE_VALUE:
        {
          var bodyData = data.sublist(12);

          //Skip packet if body is null and id = 1
          if (bodyData[0] == 0 && bodyData[1] == 0 && packetId == 1) {
            _log.log(Level.FINE,
                'Parsed Response - ID: $packetId, Type: $packetType, Body: NULL-BODY'); // ignore: lines_longer_than_80_chars
            return;
          }

          var body = utf8.decode(bodyData);
          _log.log(Level.FINE,
              'Parsed Response - ID: $packetId, Type: $packetType, Body: $body'); // ignore: lines_longer_than_80_chars

          _queue.removeFirst().complete(body);
          break;
        }
      default:
        {
          throw RconException(
              'Invalid packet: $packetType!', RconError.invalidPacket);
        }
    }
  }

  Future<String> _authenticate(String password) =>
      _write(_SERVERDATA_AUTH, password);

  Future<String> send(String command) =>
      _write(_SERVERDATA_EXECCOMMAND, command);

  Future<String> _write(int packetType, String body) {
    if (_socket == null) {
      throw RconException('Socket not connected', RconError.noAuthentication);
    }

    var encodedBody = utf8.encode(body);
    final size = encodedBody.length + 14;
    var data = ByteData(size);
    data.setInt32(0, size - 4, Endian.little);
    data.setInt32(4, ++_packetId, Endian.little);
    data.setInt32(8, packetType, Endian.little);
    _setList(data, encodedBody, 12);

    _socket.add(data.buffer.asInt8List());

    var completer = Completer<String>();
    _queue.add(completer);
    return completer.future;
  }

  void _setList(ByteData data, Iterable<int> list, int pos) {
    for (var e in list) {
      // ignore: parameter_assignments
      data.setInt8(pos++, e);
    }
  }
}
