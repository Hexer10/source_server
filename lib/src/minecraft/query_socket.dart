part of '../../server.dart';

/// Query Protocol
class MinecraftQuerySocket extends BaseSocket<RawDatagramSocket> {
  static const magic = 0xFEFD;

  static const STAT = 0;
  static const HANDSHAKE = 9;

  final _onInfo =
      StreamController<Map<String, Map<String, dynamic>>>.broadcast();

  final _SID = Random().nextInt(1000);

  final int listenPort;

  Stream get onInfo => _onInfo.stream;

  final _queue =
      Queue<Tuple2<int, Completer<dynamic /*Map<String, dynamic> | int*/ >>>();

  final _infoKeys = [
    'MOTD',
    'gametype',
    'map',
    'numplayers',
    'maxplayers',
    'hostport',
    'hostip',
  ];

  final _infoKeysExtended = [
    'hostname',
    'game_type',
    'game_id',
    'version',
    'plugins',
    'map',
    'numplayers',
    'maxplayers',
    'hostport',
    'hostip'
  ];

  MinecraftQuerySocket(address, port, [this.listenPort = 5000])
      : super(address, port);

  @override
  Future<void> connect() async {
    _socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, listenPort);
    _socket.listen(_onData);
  }

  void _onData(RawSocketEvent event) {
    if (event != RawSocketEvent.read) {
      return;
    }

    var data = _socket.receive();
    if (data == null) {
      return;
    }

    final rawData = data.data;
    final bdata = ByteData.view(rawData.buffer);
    var type = bdata.getUint8(0);

    if (type == HANDSHAKE) {
      var item = _queue.removeFirst();
      item.item2.complete(
          int.parse(utf8.decode(rawData.sublist(5, rawData.length - 1))));
    } else if (type == STAT) {
      Map<String, dynamic> data;
      var item = _queue.removeFirst();
      var offset = 5;
      if (item.item1 == STAT) {
        // Normal info
        var index = 0;
        for (var i = 0; i < 5; i++) {
          for (;;) {
            var bytes = <int>[];
            var byte = bdata.getUint8(offset);
            offset++;
            if (byte == 0) {
              data[_infoKeys[index]] = utf8.decode(bytes);
              index++;
              break;
            }
            bytes.add(byte);
          }
        }
        data[_infoKeys[5]] = bdata.getUint16(offset, Endian.little);
        offset += 2;
        for (;;) {
          var bytes = <int>[];
          var byte = bdata.getUint8(offset);
          offset++;
          if (byte == 0) {
            data[_infoKeys[6]] = utf8.decode(bytes);
            break;
          }
          bytes.add(byte);
        }
        item.item2.complete(data);
      } else if (item.item1 == STAT + 1) {
        // Extended info

      }
    }
  }

  Future<Map<String, dynamic>> getInfo({bool extended = false}) async {
    var token = await getToken();
    var bdata = ByteData(2 + 1 + 4 + (extended ? 4 : 0));
    bdata.setUint16(0, magic);
    bdata.setUint8(2, 0);
    bdata.setUint32(3, _SID);
    bdata.setUint32(7, token);
    if (extended) {
      bdata.setUint32(11, 0);
    }
    var buffer = bdata.buffer.asUint8List();
    var completer = Completer<Map<String, dynamic>>();
    _queue.add(Tuple2<int, Completer<Map<String, dynamic>>>(
        STAT + (extended ? 1 : 0), completer));
    _socket.send(buffer, address, port);
    return completer.future;
  }

  Future<int> getToken() {
    var bdata = ByteData(2 + 1 + 4);
    bdata.setUint16(0, magic);
    bdata.setUint8(2, 9);
    bdata.setUint32(3, _SID);
    var buffer = bdata.buffer.asUint8List();
    var completer = Completer<int>();
    _queue.add(Tuple2<int, Completer<int>>(HANDSHAKE, completer));
    _socket.send(buffer, address, port);
    return completer.future;
  }
}
