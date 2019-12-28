/// Support for both Query and RCON Source protocols.
/// Refer to:
///  https://wiki.vg/Query
///  https://wiki.vg/RCON
///  for the protocols documentations.
part of '../server.dart';

/// RCON and Query
class MinecraftServer {
  /// The remote server address.
  final InternetAddress address;

  /// The remote server port.
  final int port;

  String _password;

  /// Password used for the RCON authentication
  String get password => _password;

  MinecraftQuerySocket _query;
  RconSocket _rcon;

  /// Direct access to the QuerySocket.
  MinecraftQuerySocket get query => _query;

  /// Direct access to the [RconSocket].
  RconSocket get rcon => _rcon;

  Completer<Map<String, Map<String, dynamic>>> _players;
  Completer<Map<String, dynamic>> _info;
  final _log = Logger('MineCraft');

  /// [SourceServer] constructor,
  /// a [password] may be supplied to connect to thru the rcon,
  /// or be supplied later with [rconAuthenticate].
  /// [connect] must be called in order to establish the connection
  /// to the Query and RCON servers.
  MinecraftServer(this.address, this.port, [String password]) {
    _query = MinecraftQuerySocket(address, port);

    // RCON protocol is the same in all games so far
    if (_password != null) {
      _rcon = RconSocket(address, port, password);
    }
  }

  /// Establishes the connection to the Query and Rcon(if password was supplied)
  /// servers.
  Future<void> connect() async {
    await query.connect();


    if (password != null) {
      await rcon.connect();
    }
  }

  /// Authenticates to RCON server if not done before.
  Future<void> rconAuthenticate(String password) async {
    if (_rcon != null) {
      throw Exception('RCON already authenticated!');
    }

    _password = password;
    _rcon = RconSocket(address, port, password);

    try {
      await rcon.connect();
    } on RconException {
      _rcon = null;
      rethrow;
    }
  }

  /// Returns a [Future] that completes with all the connected players info
  /// [ref link]: https://developer.valvesoftware.com/wiki/Server_queries#Response_Format
  Future<Map<String, dynamic>> getInfo() async {
    if (_info == null || _info.isCompleted) {
      _info = Completer();
      query.getInfo();
    }

    return _info.future;
  }

  /// Closes the connection to the remote
  /// Query and RCON(if connected) servers.
  void close() {
    query.close();
    rcon?.close();
  }
}
