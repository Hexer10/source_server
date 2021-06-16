import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import '../exceptions/exceptions.dart';

/// Allows the connection to a remote server using the rcon protocol.
/// If the current ip address is banned no reply will be sent and the authentication will hang forever.
abstract class RconSocket {
  factory RconSocket._(Socket socket) = _RconSocketImpl;

  /// Authenticates to the remote server.
  /// Returns false if the authentication failed, true otherwise.
  Future<bool> authenticate(String password);

  /// Executes a command on the remote server.
  Future<String> command(String command);

  /// Stream of command reply from the server.
  /// Useful if you don't need to wait to the replies and want to get
  /// the multi-packets reply too.
  Stream<String> get commandStream;

  /// If the authentication failed this is might contain a more descriptive message.
  String? get errorMessage;

  /// Closes the connection
  void close();

  /// Setup the connection to the remote server.
  static Future<RconSocket> connect(dynamic address, int port) async {
    assert(address is String || address is InternetAddress);
    if (address is String) {
      // ignore: parameter_assignments
      address = (await InternetAddress.lookup(address)).first;
    }

    final socket = await Socket.connect(address, port);
    return RconSocket._(socket);
  }
}

class _RconSocketImpl implements RconSocket {
  final Socket socket;
  final StreamController<String> _commandStream = StreamController<String>();

  String? _errorMessage;

  @override
  Stream<String> get commandStream => _commandStream.stream;

  @override
  String? get errorMessage => _errorMessage;

  Completer<bool>? authCompleter;
  final HashMap<int, Completer<String>> cmdMap =
      HashMap<int, Completer<String>>();

  bool skip = true;
  int packetId = 2;
  bool? authStatus;

  _RconSocketImpl(this.socket) {
    socket.listen(onEvent);
  }

  @override
  Future<bool> authenticate(String password) async {
    if (authCompleter?.isCompleted ?? false) {
      assert(authStatus != null);
      return authStatus!;
    }
    if (authCompleter != null) {
      return authCompleter!.future;
    }

    if (password.isEmpty) {
      throw ArgumentError.value(password, 'password', 'Cannot be empty!');
    }
    assert(authCompleter == null);

    authCompleter = Completer<bool>();
    socket.add(_RconPacket.auth(password: password, id: 1).bytes);
    return authCompleter!.future;
  }

  @override
  Future<String> command(String command) {
    if (!(authStatus ?? false)) {
      throw const RconException(
          'Cannot send an RCON command while not authenticated!');
    }
    final resultCompleter = Completer<String>();

    cmdMap[packetId] = resultCompleter;
    socket.add(_RconPacket.command(command: command, id: packetId++).bytes);

    return resultCompleter.future;
  }

  @override
  void close() {
    socket.destroy();
  }

  void onEvent(Uint8List event) {
    final packet = _RconPacket(event);
    if (packet.id == 0) {
      return;
    }

    if (packet.type == 2) {
      authStatus = packet.id != -1;
      authCompleter!.complete(packet.id != -1);
    } else if (packet.type == 0) {
      // Auth packet
      if (packet.id == 1) {
        _errorMessage = packet.bodyAsString;
        return;
      }
      final body = packet.bodyAsString;
      _commandStream.add(body);

      cmdMap.remove(packet.id)?.complete(body);
    }
  }
}

class _RconPacket {
  final Uint8List bytes;

  late final ByteData _byteData;

  int get size => _byteData.getInt32(0, Endian.little);

  int get id => _byteData.getInt32(4, Endian.little);

  int get type => _byteData.getInt32(8, Endian.little);

  Uint8List get body => bytes.sublist(12, bytes.length - 1);

  String get bodyAsString => utf8.decode(body, allowMalformed: true);

  _RconPacket(this.bytes) {
    _byteData = ByteData.view(bytes.buffer);
  }

  factory _RconPacket.from(
      {int id = 0, int type = 0, dynamic body = const [0x00]}) {
    assert((body is List<int> && body.isNotEmpty) || body is String);
    if (body is String) {
      body = [...utf8.encode(body), 0x00];
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

      return _RconPacket(bytes.buffer.asUint8List());
    }
    throw ArgumentError.value(body, 'body', 'Invalid type');
  }

  factory _RconPacket.auth({required String password, required int id}) {
    return _RconPacket.from(body: password, type: 3, id: id);
  }

  factory _RconPacket.command({required String command, required int id}) {
    return _RconPacket.from(body: command, type: 2, id: id);
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
