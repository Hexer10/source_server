import 'dart:async';
import 'dart:io';

import 'query/models/query_player.dart';
import 'query/models/server_info.dart';
import 'query/query_socket.dart';
import 'rcon/rcon_socket.dart';

class SourceServer implements RconSocket, QuerySocket {
  /// The address used for the connection.
  final dynamic address;

  /// The port used for the connection.
  final int port;

  final QuerySocket _querySocket;

  RconSocket? _rconSocket;

  SourceServer._(this.address, this.port, this._querySocket, this._rconSocket);

  /// Connects to the remote server using the server query protocol
  /// and the rcon protocol if the password was specified.
  /// This throws a [SocketException] if the authentication with the remote server failed.
  static Future<SourceServer> connect(dynamic address, int port,
      {String? password}) async {
    final querySocket = await QuerySocket.connect(address, port);
    RconSocket? rconSocket;
    if (password != null) {
      rconSocket = await RconSocket.connect(address, port);
      final result = await rconSocket.authenticate(password);
      if (!result) {
        querySocket.close();
        rconSocket.close();
        throw const SocketException('RCON authentication failed!');
      }
    }
    return SourceServer._(address, port, querySocket, rconSocket);
  }

  /// Authenticates to the remote server.
  /// Throws a [SocketException] if the authentication fails.
  /// Can be used to connected to the rcon without specifying the password in [connect].
  @override
  Future<bool> authenticate(String password) async {
    if (_rconSocket != null) {
      return true;
    }
    _rconSocket = await RconSocket.connect(address, port);
    final result = await _rconSocket!.authenticate(password);
    if (!result) {
      throw const SocketException('RCON authentication failed!');
    }
    return true;
  }

  @override
  void close() {
    _querySocket.close();
    _rconSocket?.close();
  }

  @override
  Future<String> command(String command) {
    if (_rconSocket == null) {
      throw const SocketException(
          'Cannot send an RCON command while not authenticated!');
    }
    return _rconSocket!.command(command);
  }

  @override
  Stream<String> get commandStream {
    assert(_rconSocket != null);
    return _rconSocket!.commandStream;
  }

  @override
  Future<ServerInfo> getInfo() => _querySocket.getInfo();

  @override
  Future<List<QueryPlayer>> getPlayers() => _querySocket.getPlayers();

  @override
  Future<Map<String, String>> getRules() => _querySocket.getRules();

  @override
  String? get errorMessage => _rconSocket?.errorMessage;
}
