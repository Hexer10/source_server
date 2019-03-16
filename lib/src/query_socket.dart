library source_server.query;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

/// Query Protocol
class QuerySocket {

  // Packets sent

  //final _A2S_PING = 0x69;
  final _A2S_INFO = 0x54;
  final _A2S_PLAYER = 0x55;
  //final _A2S_RULES = 0x56;
  //final _A2S_SERVERQUERY_GETCHALLENGE = 0x57;


  //Packets received

  //static const _S2A_PING = 0x6A;
  static const _S2A_CHALLENGE = 0x41;
  static const _S2A_INFO = 0x49;
  //static const _S2A_INFO_OLD = 0x6D; // Old GoldSource, HLTV uses it
  static const _S2A_PLAYER = 0x44;
  //static const _S2A_RULES = 0x45;
  //static const _S2A_RCON = 0x6C;

  final _onInfo = StreamController<Map<String, dynamic>>.broadcast();
  final _onPlayers =
      StreamController<Map<String, Map<String, dynamic>>>.broadcast();

  final InternetAddress address;
  final int port;

  final _infoKeys = [
    'protocol',
    'name',
    'map',
    'folder',
    'game',
    'appid',
    'players',
    'maxplayers',
    'bots',
    'servertype',
    'visibility',
    'password',
    'vac'
  ];

  Stream get onInfo => _onInfo.stream;

  Stream get onPlayers => _onPlayers.stream;

  RawDatagramSocket _socket;

  List<int> _challenge;

  Completer<void> _challengeCompleter;

  QuerySocket(this.address, this.port);

  Future<void> connect() async {
    _socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 5000);
    _socket.listen(_onData);
  }


  void _onData(RawSocketEvent event) {
    if (event != RawSocketEvent.read) {
      return;
    }

    var data = _socket.receive();
    if (data == null) {
      return;
    }

    final Uint8List rawData = data.data;

    switch (rawData[4]) {
      //Info
      case _S2A_INFO:
        {
          var info = <String, dynamic>{};

          info[_infoKeys[0]] = rawData[5];

          var data = rawData.skip(6).toList();

          //Read the 4 null-terminated string params
          var index = 0;
          var oldIndex = 0;
          for (var i = 1; i <= 4; i++) {
            index = data.indexWhere((e) => e == 0, oldIndex);
            info[_infoKeys[i]] = ascii.decode(data.sublist(oldIndex, index));
            oldIndex = index + 1;
          }

          var bdata =
              ByteData.view(Int8List.fromList(data.sublist(oldIndex)).buffer);
          info[_infoKeys[5]] = bdata.getInt16(0, Endian.little);
          info[_infoKeys[6]] = bdata.getInt8(2);
          info[_infoKeys[7]] = bdata.getInt8(3);
          info[_infoKeys[8]] = bdata.getInt8(4);
          info[_infoKeys[9]] = ascii.decode([bdata.getInt8(5)]);
          info[_infoKeys[10]] = ascii.decode([bdata.getInt8(6)]);
          info[_infoKeys[11]] = bdata.getInt8(7);
          info[_infoKeys[12]] = bdata.getInt8(8);

          _onInfo.add(info);
          break;
        }
      //Challenge
      case _S2A_CHALLENGE:
        {
          _challenge = rawData.skip(5).toList();
          _challengeCompleter.complete();
          break;
        }
      //Players
      case _S2A_PLAYER:
        {
          var count = rawData[5];
          if (count == 0) {
            _onPlayers.add(<String, Map<String, dynamic>>{});
            break;
          }

          var players = <String, Map<String, dynamic>>{};

          var data = rawData.skip(6).toList();
          var start = 0;

          for (var i = 0; i < count; i++) {
            Map userMap = <String, dynamic>{};
            userMap['index'] = data[start];
            var index = data.indexWhere((e) => e == 0, start + 1);
            userMap['name'] = ascii.decode(data.sublist(start + 1, index));
            var bdata = ByteData.view(
                Uint8List.fromList(data.sublist(index + 1, index + 9)).buffer);
            userMap['score'] = bdata.getInt32(0, Endian.little);
            userMap['duration'] = bdata.getFloat32(4, Endian.little);

            players[userMap['name']] = userMap;
            start = index + 9;
          }

          _onPlayers.add(players);
          break;
        }
    }
  }

  void updateInfo() {
    var string = ascii.encode('Source Engine Query');
    final len = 6 + string.length;

    var packet = ByteData(len);
    packet.setUint32(0, 0xFFFFFFFF);
    packet.setUint8(4, _A2S_INFO);
    _setList(packet, string, 5);

    _socket.send(packet.buffer.asUint8List(), address, port);
  }

  void _updateChallenge() {
    var packet = ByteData(9);
    packet.setUint32(0, 0xFFFFFFFF);
    //TODO: Implement rules challenge.
    packet.setUint8(4, _A2S_PLAYER);
    packet.setUint32(5, 0xFFFFFFFF);

    if (_challengeCompleter != null && !_challengeCompleter.isCompleted) {
      return;
    }

    _challengeCompleter = Completer();
    _socket.send(packet.buffer.asUint8List(), address, port);
  }

  Future<void> updatePlayers() async {
    if (_challenge == null) {
      _updateChallenge();
      await _challengeCompleter.future;
    }

    var packet = ByteData(9);
    packet.setUint32(0, 0xFFFFFFFF);
    packet.setUint8(4, _A2S_PLAYER);
    _setList(packet, _challenge, 5);

    print('Sent: ${packet.buffer.asUint8List()}');
    _socket.send(packet.buffer.asUint8List(), address, port);
  }

  ///TODO(Hexah): Implement updateRules.
  //Future<void> updateRules() async {}

  void close() =>
    _socket.close();

  void _setList(ByteData data, Iterable<int> list, int pos) {
    for (var e in list) {
      // ignore: parameter_assignments
      data.setUint8(pos++, e);
    }
  }
}
