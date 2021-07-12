import 'dart:async';
import 'dart:io';

import '../minecraft_server.dart';

/// Wrapper for both [RconSocket] and [QuerySocket]
class MinecraftServer implements RconSocket, QuerySocket, ListPingSocket {
  /// The address used for the connection.
  final dynamic address;

  /// The port used for the connection.
  final int port;

  /// Timeout to wait for the remote server reply.
  final Duration timeout;

  final ListPingSocket _listPingSocket;
  final QuerySocket? _querySocket;
  RconSocket? _rconSocket;

  MinecraftServer._(this.address, this.port, this._listPingSocket,
      this._querySocket, this._rconSocket, this.timeout);

  /// Connects to the remote server using the `server ping protocol`.
  /// The query connection is established only if the [queryPort] is not null,
  /// and the same applies to the rcon connection which requires both the [rconPort] and [password] to be non null.
  /// This throws a [SocketException] if the authentication with the remote server failed.
  static Future<MinecraftServer> connect(dynamic address, int port,
      {int? queryPort,
      int? rconPort,
      String? password,
      Duration timeout = const Duration(seconds: 30)}) async {
    final listPingSocket = await ListPingSocket.connect(address, port);

    QuerySocket? querySocket;
    RconSocket? rconSocket;

    if (queryPort != null) {
      querySocket = await QuerySocket.connect(address, queryPort);
    }
    if (rconPort != null && password != null) {
      rconSocket = await RconSocket.connect(address, rconPort).timeout(timeout);
      final result = await rconSocket.authenticate(password).timeout(timeout);
      if (!result) {
        listPingSocket.close();
        querySocket?.close();
        rconSocket.close();
        throw RconAuthenticationException(rconSocket.errorMessage ?? '');
      }
    }
    return MinecraftServer._(
        address, port, listPingSocket, querySocket, rconSocket, timeout);
  }

  /// Authenticates to the remote server.
  /// Throws a [RconAuthenticationException] if the authentication fails.
  /// Can be used to connected to the rcon without specifying the password in [connect].
  /// If the [rconPort] is null, the [port] is used for the connection.
  @override
  Future<bool> authenticate(String password, {int? rconPort}) async {
    if (_rconSocket != null) {
      return true;
    }
    _rconSocket =
        await RconSocket.connect(address, rconPort ?? port).timeout(timeout);
    final result = await _rconSocket!.authenticate(password).timeout(timeout);
    if (!result) {
      _rconSocket!.close();
      throw RconAuthenticationException(_rconSocket!.errorMessage ?? '');
    }
    return true;
  }

  @override
  void close() {
    _listPingSocket.close();
    _querySocket?.close();
    _rconSocket?.close();
  }

  @override
  Future<String> command(String command) {
    if (_rconSocket == null) {
      throw const RconException(
          'Cannot send an RCON command while not authenticated!');
    }
    return _rconSocket!.command(command).timeout(timeout);
  }

  @override
  Stream<String> get commandStream {
    if (_rconSocket == null) {
      throw const RconException(
          'Cannot listen to the commandStream if the RCON is not authenticated.');
    }
    return _rconSocket!.commandStream;
  }

  @override
  Future<ServerInfo> getInfo() {
    if (_querySocket == null) {
      throw const QueryException('Query socket not connected.');
    }
    return _querySocket!.getInfo().timeout(timeout);
  }

  @override
  Future<ServerFullInfo> getFullInfo() {
    if (_querySocket == null) {
      throw const QueryException('Query socket not connected.');
    }
    return _querySocket!.getFullInfo().timeout(timeout);
  }

  @override
  String? get errorMessage => _rconSocket?.errorMessage;

  @override
  Future<ServerPingInfo> getPingInfo() =>
      _listPingSocket.getPingInfo().timeout(timeout);
}
