import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import '../../buffer.dart';
import '../../exceptions/exceptions.dart';
import 'models/server_info.dart';
import 'query_packet.dart';

/// Parsed map of a ServerFullInfo reply.
/// See [QuerySocket.getFullInfo].
typedef ServerFullInfo = Map<String, String>;

/// Wrapper for the query protocol.
abstract class QuerySocket {
  factory QuerySocket._(
          InternetAddress address, int port, RawDatagramSocket socket) =
      _QuerySocketImpl;

  /// Returns the info about this server.
  /// See [getFullInfo]
  Future<ServerInfo> getInfo();

  /// Returns more complete info about this server.
  /// See [getInfo]
  Future<ServerFullInfo> getFullInfo();

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
  Completer<ServerFullInfo>? fullInfoCompleter;
  Completer<List<int>>? challengeCompleter;

  _QuerySocketImpl(this.address, this.port, this.socket) {
    socket.listen(onEvent);
  }

  Future<List<int>> getChallenge() async {
    assert(!(challengeCompleter?.isCompleted ?? false));
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

    getChallenge().then(
        (value) => socket.send(QueryPacket.info(value).bytes, address, port));

    return infoCompleter!.future;
  }

  @override
  Future<ServerFullInfo> getFullInfo() {
    assert(!(fullInfoCompleter?.isCompleted ?? false));
    if (fullInfoCompleter != null) {
      return fullInfoCompleter!.future;
    }

    fullInfoCompleter = Completer<ServerFullInfo>();

    getChallenge().then((value) =>
        socket.send(QueryPacket.fullInfo(value).bytes, address, port));

    return fullInfoCompleter!.future;
  }

  void parseChallenge(Uint8List bytes) {
    final strValue = utf8.decode(bytes.takeWhile((e) => e != 0).toList());
    final value = int.parse(strValue);

    challengeCompleter!.complete(value.toInt32());
    challengeCompleter = null;
  }

  void parseInfo(Uint8List bytes) {
    final read = ReadBuffer.fromUint8List(bytes);

    final motd = read.string;
    final gametype = read.string;
    final map = read.string;
    final numPlayers = int.parse(read.string);
    final maxPlayers = int.parse(read.string);
    final port = read.int16;
    final ip = read.string;

    infoCompleter!.complete(ServerInfo(
        motd: motd,
        gametype: gametype,
        map: map,
        players: numPlayers,
        maxPlayers: maxPlayers,
        port: port,
        ip: ip));
    infoCompleter = null;
  }

  void parseFullInfo(Uint8List bytes) {
    final read = ReadBuffer.fromUint8List(bytes.sublist(15));
    final info = <String, String>{};
    while (read.peek(0) != 0 && read.peek(1) != 0) {
      final key = read.string;
      final value = read.string;
      info[key] = value;
    }
    read.skip(2);

    fullInfoCompleter!.complete(info);
    fullInfoCompleter = null;
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

    final type = data[0];

    if (type == 0x09) {
      parseChallenge(data.sublist(5));
    } else if (type == 0x00) {
      // Check if contains the "full info" padding. Checking the first two indexes should be enough.
      if (data[5] == 0x73 && data[6] == 0x70) {
        parseFullInfo(data.sublist(5));
      } else {
        parseInfo(data.sublist(5));
      }
    } else {
      throw QueryException('Unrecognized type: $type');
    }
  }

  @override
  void close() => socket.close();
}

extension on int {
  List<int> toInt32() {
    final byteData = ByteData(4);
    byteData.setInt32(0, this);
    return byteData.buffer.asUint8List();
  }
}
