import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import '../exceptions/exceptions.dart';
import 'rcon_packet.dart';

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
    socket.add(RconPacket.auth(password: password, id: 1).bytes);
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
