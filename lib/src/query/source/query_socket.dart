import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';

import '../../../source_server.dart';
import '../../buffer.dart';
import 'query_packet.dart';

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
  Future<List<ServerRule>> getRules();

  /// Closes the connection
  void close();

  /// Setup the connection to the remote server.
  /// This does not guarantee that the connection will be established successfully.
  static Future<QuerySocket> connect(dynamic address, int port,
      {int localPort = 0}) async {
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
  Completer<UnmodifiableListView<QueryPlayer>>? playersCompleter;
  Completer<UnmodifiableListView<ServerRule>>? rulesCompleter;

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
    socket.send(QueryPacket.challenge.bytes, address, port);
    return challengeCompleter!.future;
  }

  @override
  Future<ServerInfo> getInfo() {
    assert(!(infoCompleter?.isCompleted ?? false));
    if (infoCompleter != null) {
      return infoCompleter!.future;
    }
    infoCompleter = Completer<ServerInfo>();
    socket.send(QueryPacket.info.bytes, address, port);
    return infoCompleter!.future;
  }

  @override
  Future<List<QueryPlayer>> getPlayers() async {
    assert(!(playersCompleter?.isCompleted ?? false));
    if (playersCompleter != null) {
      return playersCompleter!.future;
    }
    playersCompleter = Completer<UnmodifiableListView<QueryPlayer>>();
    // ignore: unawaited_futures
    getChallenge().then((value) =>
        socket.send(QueryPacket.players(value).bytes, address, port));
    return playersCompleter!.future;
  }

  @override
  Future<List<ServerRule>> getRules() async {
    assert(!(rulesCompleter?.isCompleted ?? false));
    if (rulesCompleter != null) {
      return rulesCompleter!.future;
    }
    rulesCompleter = Completer<UnmodifiableListView<ServerRule>>();
    // ignore: unawaited_futures
    getChallenge().then(
        (value) => socket.send(QueryPacket.rules(value).bytes, address, port));
    return rulesCompleter!.future;
  }

  void parseInfo(Uint8List bytes) {
    final read = ReadBuffer.fromUint8List(bytes);

    final protocol = read.uint8;
    final name = read.string;
    final map = read.string;
    final folder = read.string;
    final game = read.string;
    final id = read.uint16;
    final players = read.uint8;
    final maxPlayers = read.uint8;
    final bots = read.uint8;
    final type = ServerType(read.uint8);
    final os = ServerOS(read.uint8);
    final visibility = ServerVisibility(read.uint8);
    final vac = ServerVAC(read.uint8);
    /* TODO: Add TheShip flags*/
    final version = read.string;
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
        tvName = read.string;
      }
      if (edf & 0x20 != 0) {
        keywords = read.string;
      }
      if (edf & 0x01 != 0) {
        gameId = read.uint64;
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

    // Since 2020 also the A2S_INFO packet could need the challenge on some servers.
    if (infoCompleter != null && !infoCompleter!.isCompleted) {
      socket.send(QueryPacket.infoChallenge(bytes).bytes, address, port);
    }
  }

  void parsePlayers(Uint8List bytes) {
    assert(playersCompleter != null);
    assert(!playersCompleter!.isCompleted);
    final read = ReadBuffer.fromUint8List(bytes.sublist(1));
    final players = <QueryPlayer>[];
    while (read.canReadMore) {
      players.add(QueryPlayer(
          index: read.uint8,
          name: read.string,
          score: read.int32,
          duration: read.float32));
      /* TODO: Add TheShip params */
    }
    playersCompleter!.complete(UnmodifiableListView(players));
    playersCompleter = null;
  }

  void parseRules(Uint8List bytes) {
    assert(rulesCompleter != null);
    assert(!rulesCompleter!.isCompleted);
    final read = ReadBuffer.fromUint8List(bytes.sublist(2));
    final rules = <ServerRule>[];
    while (read.canReadMore) {
      rules.add(ServerRule(read.string, read.string));
    }
    rulesCompleter!.complete(UnmodifiableListView(rules));
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
