import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../exceptions/exceptions.dart';
import '../read_buffer.dart';
import 'models/query_player.dart';
import 'models/server_info.dart';
import 'models/server_os.dart';
import 'models/server_type.dart';
import 'models/server_vac.dart';
import 'models/server_visibility.dart';

/// Wrapper for the query protocol.
abstract class QuerySocket {
  factory QuerySocket._(
          InternetAddress address, int port, RawDatagramSocket socket) =
      _QuerySocketImpl;

  /// Returns the info about this server.
  Future<ServerInfo> getInfo();

  /// Returns a list of currently connected players.
  Future<List<QueryPlayer>> getPlayers();

  /// Returns the server rules, or configuration variables in name/value pairs.
  /// Warning: In some games such as CS:GO this never completes without
  /// having installed a plugin on the server.
  Future<Map<String, String>> getRules();

  /// Closes the connection
  void close();

  /// Setup the connection to the remote server.
  /// This does not guarantee that the connection will be established successfully.
  static Future<QuerySocket> connect(dynamic address, int port,
      {int localPort = 6000}) async {
    assert(address is String || address is InternetAddress);
    if (address is String) {
      // ignore: parameter_assignments
      address = (await InternetAddress.lookup(address)).first;
    }

    final socket =
        await RawDatagramSocket.bind(InternetAddress.anyIPv4, localPort);
    return QuerySocket._(address as InternetAddress, port, socket);
  }
}

class _QuerySocketImpl implements QuerySocket {
  final InternetAddress address;
  final int port;
  final RawDatagramSocket socket;

  Completer<ServerInfo>? infoCompleter;
  Completer<Uint8List>? challengeCompleter;
  Completer<List<QueryPlayer>>? playersCompleter;
  Completer<Map<String, String>>? rulesCompleter;

  Uint8List? _challenge;

  _QuerySocketImpl(this.address, this.port, this.socket) {
    socket.listen(onEvent);
  }

  Future<Uint8List> getChallenge() async {
    if (_challenge != null) {
      return _challenge!;
    }
    // assert(!(challengeCompleter?.isCompleted ?? false));
    if (challengeCompleter != null) {
      return challengeCompleter!.future;
    }
    challengeCompleter = Completer<Uint8List>();
    socket.send(_QueryPacket.challenge.bytes, address, port);
    return challengeCompleter!.future;
  }

  @override
  Future<ServerInfo> getInfo() {
    assert(!(infoCompleter?.isCompleted ?? false));
    if (infoCompleter != null) {
      return infoCompleter!.future;
    }
    infoCompleter = Completer<ServerInfo>();
    socket.send(_QueryPacket.info.bytes, address, port);
    return infoCompleter!.future;
  }

  @override
  Future<List<QueryPlayer>> getPlayers() async {
    assert(!(playersCompleter?.isCompleted ?? false));
    if (playersCompleter != null) {
      return playersCompleter!.future;
    }
    playersCompleter = Completer<List<QueryPlayer>>();
    // ignore: unawaited_futures
    getChallenge().then((value) =>
        socket.send(_QueryPacket.players(value).bytes, address, port));
    return playersCompleter!.future;
  }

  @override
  Future<Map<String, String>> getRules() async {
    assert(!(rulesCompleter?.isCompleted ?? false));
    if (rulesCompleter != null) {
      return rulesCompleter!.future;
    }
    rulesCompleter = Completer<Map<String, String>>();
    // ignore: unawaited_futures
    getChallenge().then(
        (value) => socket.send(_QueryPacket.rules(value).bytes, address, port));
    return rulesCompleter!.future;
  }

  void parseInfo(Uint8List bytes) {
    final read = ReadBuffer.fromUint8List(bytes);

    final protocol = read.uint8;
    final name = read.readString;
    final map = read.readString;
    final folder = read.readString;
    final game = read.readString;
    final id = read.int16;
    final players = read.uint8;
    final maxPlayers = read.uint8;
    final bots = read.uint8;
    final type = ServerType(read.uint8);
    final os = ServerOS(read.uint8);
    final visibility = ServerVisibility(read.uint8);
    final vac = ServerVAC(read.uint8);
    /* TODO: Add TheShip flags*/
    final version = read.readString;
    var info = ServerInfo(
        protocol: protocol,
        name: name,
        map: map,
        folder: folder,
        game: game,
        id: id,
        players: players,
        maxPlayers: maxPlayers,
        bots: bots,
        type: type,
        os: os,
        visibility: visibility,
        vac: vac,
        version: version);
    if (read.canReadMore) {
      final edf = read.uint8;
      int? port;
      int? steamId;
      int? tvPort;
      String? tvName;
      String? keywords;
      int? gameId;

      if (edf & 0x80 != 0) {
        port = read.uint16;
      }
      if (edf & 0x10 != 0) {
        steamId = read.int64;
      }
      if (edf & 0x40 != 0) {
        tvPort = read.uint16;
        tvName = read.readString;
      }
      if (edf & 0x20 != 0) {
        keywords = read.readString;
      }
      if (edf & 0x01 != 0) {
        gameId = read.int64;
      }
      info = info.copyWith(
          port: port,
          steamId: steamId,
          tvPort: tvPort,
          tvName: tvName,
          keywords: keywords,
          gameId: gameId);
    }

    infoCompleter!.complete(info);
    infoCompleter = null;
  }

  void parseChallenge(Uint8List bytes) {
    _challenge = bytes;
    challengeCompleter!.complete(_challenge);
    challengeCompleter = null;
  }

  void parsePlayers(Uint8List bytes) {
    assert(playersCompleter != null);
    assert(!playersCompleter!.isCompleted);
    final read = ReadBuffer.fromUint8List(bytes.sublist(1));
    final players = <QueryPlayer>[];
    while (read.canReadMore) {
      players.add(QueryPlayer(
          index: read.uint8,
          name: read.readString,
          score: read.int32,
          duration: read.float32));
      /* TODO: Add TheShip params */
    }
    playersCompleter!.complete(players);
    playersCompleter = null;
  }

  void parseRules(Uint8List bytes) {
    assert(rulesCompleter != null);
    assert(!rulesCompleter!.isCompleted);
    final read = ReadBuffer.fromUint8List(bytes.sublist(2));
    final rules = <String, String>{};
    while (read.canReadMore) {
      final key = read.readString;
      final value = read.readString;
      rules[key] = value;
    }
    rulesCompleter!.complete(rules);
    rulesCompleter = null;
  }

  void onEvent(RawSocketEvent event) {
    if (event != RawSocketEvent.read) {
      return;
    }
    final datagram = socket.receive();
    if (datagram == null) {
      return;
    }

    final data = datagram.data;
    final header = data[4];

    if (header == 0x49) {
      parseInfo(data.sublist(5));
    } else if (header == 0x41) {
      parseChallenge(data.sublist(5));
    } else if (header == 0x44) {
      parsePlayers(data.sublist(5));
    } else if (header == 0x45) {
      parseRules(data.sublist(5));
    } else {
      throw QueryException('Unrecognized header: $header');
    }
  }

  @override
  void close() => socket.close();
}

class _QueryPacket {
  static const _QueryPacket info = _QueryPacket([
    0xff,
    0xff,
    0xff,
    0xff,
    0x54, // T
    0x53, // Source Engine Query
    0x6f,
    0x75,
    0x72,
    0x63,
    0x65,
    0x20,
    0x45,
    0x6e,
    0x67,
    0x69,
    0x6e,
    0x65,
    0x20,
    0x51,
    0x75,
    0x65,
    0x72,
    0x79,
    0x0
  ]);

  static const _QueryPacket challenge =
      _QueryPacket([0xff, 0xff, 0xff, 0xff, 0x55, 0xff, 0xff, 0xff, 0xff]);

  final List<int> bytes;

  const _QueryPacket(this.bytes);

  _QueryPacket.players(Uint8List challenge)
      : bytes = [0xff, 0xff, 0xff, 0xff, 0x55, ...challenge];

  _QueryPacket.rules(Uint8List challenge)
      : bytes = [0xff, 0xff, 0xff, 0xff, 0x56, ...challenge];
}
