import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

/// Allows the connection to a remote server using the rcon protocol.
/// If the current ip address is banned no reply will be sent and the authentication will hang forever.
abstract class RconSocket {
  factory RconSocket._(Socket socket) = _RconSocketImpl;

  /// Authenticates to the remote server.
  /// Returns false if the authentication failed, true otherwise.
  FutureOr<bool> authenticate(String password);

  /// Executes a command on the remote server.
  Future<String> command(String command);

  /// Stream of command reply from the server.
  /// Useful if you don't need to wait to the replies and want to get
  /// the multi-packets reply too.
  Stream<String> get commandStream;

  /// If the authentication failed this is might contain a more descriptive message.
  String get errorMessage;

  /// Closes the connection
  void close();

  /// Setup the connection to the remote server.
  static Future<RconSocket> connect(dynamic address, int port) async {
    assert(address is String || address is InternetAddress);
    if (address is String) {
      // ignore: parameter_assignments
      address = (await InternetAddress.lookup(address as String)).first;
    }

    final socket = await Socket.connect(address, port);
    return RconSocket._(socket);
  }
}

class _RconSocketImpl implements RconSocket {
  final Socket socket;
  final StreamController<String> _commandStream = StreamController<String>();

  /* late final */
  String _errorMessage;

  @override
  Stream<String> get commandStream => _commandStream.stream;

  @override
  String get errorMessage => _errorMessage;

  /* late final */
  Completer<bool> authCompleter;
  final HashMap<int, Completer<String>> cmdMap =
      HashMap<int, Completer<String>>();

  bool skip = true;
  int packetId = 2;
  bool authStatus;

  _RconSocketImpl(this.socket) : assert(socket != null) {
    socket.listen(onEvent);
  }

  @override
  FutureOr<bool> authenticate(String password) {
    if (authCompleter?.isCompleted ?? false) {
      assert(authStatus != null);
      return authStatus;
    }
    if (authCompleter != null) {
      return authCompleter.future;
    }
    assert(password != null && password.isNotEmpty);
    assert(authCompleter == null);

    authCompleter = Completer<bool>();
    socket.add(RconPacket.auth(password: password, id: 1).bytes);
    return authCompleter.future;
  }

  @override
  Future<String> command(String command) {
    assert(command != null);
    assert(authStatus ?? false);
    final resultCompleter = Completer<String>();

    cmdMap[packetId] = resultCompleter;
    socket.add(RconPacket.command(command: command, id: packetId++).bytes);

    return resultCompleter.future;
  }

  @override
  void close() {
    socket.destroy();
  }

  void onEvent(Uint8List event) {
    final packet = RconPacket(event);
    if (packet.id == 0) {
      return;
    }

    if (packet.id == 1) {
      if (packet.type == 0) {
        authStatus = false;
        authCompleter.complete(false);
        _errorMessage = packet.bodyAsString;
        return;
      }
      assert(!authCompleter.isCompleted);

      authStatus = packet.id != -1;
      authCompleter.complete(packet.id != -1);
      _errorMessage = '';
    } else if (packet.type == 0) {
      final body = packet.bodyAsString;
      _commandStream.add(body);

      cmdMap.remove(packet.id)?.complete(body);
    }
  }
}

class RconPacket {
  final Uint8List bytes;

  /* late final */
  ByteData _byteData;

  int get size => _byteData.getInt32(0, Endian.little);

  int get id => _byteData.getInt32(4, Endian.little);

  int get type => _byteData.getInt32(8, Endian.little);

  Uint8List get body => bytes.sublist(12, bytes.length - 1);

  String get bodyAsString => utf8.decode(body, allowMalformed: true);

  RconPacket(this.bytes) {
    _byteData = ByteData.view(bytes.buffer);
  }

  factory RconPacket.from(
      {int id = 0, int type = 0, dynamic body = const [0x00]}) {
    assert(id != null);
    assert(type != null);
    assert(body != null);
    assert((body is List<int> && body.isNotEmpty) || body is String);
    if (body is String) {
      body = [...utf8.encode(body as String), 0x00];
    }
    if (body is List<int>) {
      final size = 4 + 4 + body.length + 1;
      final bytes = ByteData(size + 4);

      var offset = 0;
      bytes.setInt32(offset, size, Endian.little);
      offset += 4;

      bytes.setInt32(offset, id, Endian.little);
      offset += 4;

      bytes.setInt32(offset, type, Endian.little);
      offset += 4;

      bytes.setList(offset, body);

      return RconPacket(bytes.buffer.asUint8List());
    }
    throw StateError('Invalid body type');
  }

  factory RconPacket.auth({String password, int id}) {
    return RconPacket.from(body: password, type: 3, id: id);
  }

  factory RconPacket.command({String command, int id}) {
    return RconPacket.from(body: command, type: 2, id: id);
  }
}

extension on ByteData {
  int setList(int byteOffset, List<int> value) {
    var count = 0;
    for (final e in value) {
      setUint8(byteOffset + count, e);
      count++;
    }
    return count;
  }
}
