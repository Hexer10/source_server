/// Support for both Query and RCON Source protocols.
/// Refer to:
///  https://developer.valvesoftware.com/wiki/Server_queries
///  https://developer.valvesoftware.com/wiki/Source_RCON_Protocol
///  for the protocols documentations.
library source_server;

import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';

import 'src/query_socket.dart';
import 'src/rcon_socket.dart';

export 'src/query_socket.dart';
export 'src/rcon_socket.dart';

/// RCON and Query
class SourceServer {
  /// The remote server address.
  final InternetAddress address;

  /// The remote server port.
  final int port;

  String _password;

  /// Password used for the RCON authentication
  String get password => _password;

  QuerySocket _query;
  RconSocket _rcon;
  final _status = RegExp(r'^([^:]+):([^:].*)$');

  /// Direct access to the [QuerySocket].
  QuerySocket get query => _query;

  /// Direct access to the [RconSocket].
  RconSocket get rcon => _rcon;

  Completer<Map<String, Map<String, dynamic>>> _players;
  Completer<Map<String, dynamic>> _info;
  final _log = Logger('SourceServer');

  /// [SourceServer] constructor,
  /// a [password] may be supplied to connect to thru the rcon,
  /// or be supplied later with [rconAuthenticate].
  /// [connect] must be called in order to establish the connection
  /// to the Query and RCON servers.
  SourceServer(this.address, this.port, [this._password]) {
    _query = QuerySocket(address, port);

    if (_password != null) {
      _rcon = RconSocket(address, port, password);
    }
  }

  /// Establishes the connection to the Query and Rcon(if password was supplied)
  /// servers.
  Future<void> connect() async {
    await query.connect();

    query.onInfo.listen(_onInfo);
    query.onPlayers.listen(_onPlayers);
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
    await rcon.connect();
  }

  /// Returns a [Future] that completes with all the connected players info
  /// (if the server is empty and empty map is returned)
  /// The map is formatted like:
  /// ```
  /// 'Bob':
  ///   'index' '0' - int
  ///   'name'  'Bob' - String
  ///   'Score' '10' - Double
  ///   'duration' '60' - Double
  ///  '...':
  ///    ...
  /// ```
  ///
  /// [ref link]: https://developer.valvesoftware.com/wiki/Server_queries#Response_Format_2
  Future<Map<String, Map<String, dynamic>>> getPlayers() async {
    if (_players == null || _players.isCompleted) {
      _players = Completer();
      query.updatePlayers();
    }

    return _players.future;
  }

  /// Returns a [Future] that completes with all the connected players info
  /// [ref link]: https://developer.valvesoftware.com/wiki/Server_queries#Response_Format
  Future<Map<String, dynamic>> getInfo() async {
    if (_info == null || _info.isCompleted) {
      query.updateInfo();
      _info = Completer();
    }

    return _info.future;
  }

  /// Sends a command to the RCON server and returns
  /// a future that completes with its reply.
  Future<String> send(String command) => rcon.send(command);

  Future<Map<String, dynamic>> getStatus() async {
    var status = (await send('status')).trim();

    var lines = status.split('\n');
    var index = lines.indexWhere((line) => line.startsWith('#'));

    _log.info('Parsing: ```\n$status\n``` Index: $index');

    var statusParsed = <String, dynamic>{};
    statusParsed['server'] = _parseServer(lines.sublist(0, index - 1));

    statusParsed['players'] =
        _parseUsers(lines.sublist(index + 1, lines.length));
    return statusParsed;
  }

  Map<String, String> _parseServer(List<String> lines) {
    var info = <String, String>{};
    for (var line in lines) {
      var match = _status.firstMatch(line);
      info[match.group(1).trim()] = match.group(2).trim();
    }
    _log.info('Parsed server: ```\n $info \n```');
    return info;
  }

  List<Map<String, String>> _parseUsers(List<String> lines) {
    var players = <Map<String, String>>[];
    //13 1 "Hexah #!" STEAM_1:0:138675850 01:41 69 0 active 307200
    for (var line in lines) {
      _log.fine('Parsing: $line');
      if (line.startsWith('#end')) {
        break;
      }

      var player = {};
      var name = line.substring(line.indexOf('"') + 1, line.lastIndexOf('"'));
      line = line.replaceAll(' "$name"', '').substring(_firstNum(line));
      var split = line.split(' ');
      player['userid'] = split[0];
      player['name'] = name;
      player['steamid'] = split[2];
      player['connected'] = split[3];
      player['ping'] = split[4];
      player['loss'] = split[5];
      player['state'] = split[6];
      player['rate'] = split[7];

      players.add(player);
    }

    _log.info('Parsed players: ```\n $players \n```');
    return players;
  }

  void _onPlayers(data) => _players.complete(data);

  void _onInfo(data) => _info.complete(data);

  int _firstNum(String string) {
    for (var i = 0; i < string.length; i++) {
      if (int.tryParse(string[i]) != null) {
        return i;
      }
    }
    return -1;
  }

  /// Closes the connection to the remote
  /// Query and RCON(if connected) servers.
  void close() {
    query.close();
    rcon?.close();
  }
}
