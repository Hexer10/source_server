import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:source_server/source_server.dart';
import 'package:source_server/src/buffer.dart';
import 'package:source_server/src/query/source/query_packet.dart';
import 'package:source_server/src/rcon/rcon_packet.dart';

class DummyServer {
  final RawDatagramSocket udpSocket;
  final ServerSocket tcpSocket;
  final String password;

  DummyServer._(this.tcpSocket, this.udpSocket, this.password) {
    udpSocket.listen(onQueryData);
    tcpSocket.listen(newSocket);
  }

  static Future<DummyServer> bind(
    dynamic address, {
    int port = 27015,
    String password = '',
  }) async {
    final tcpSocket = await ServerSocket.bind(address, port);
    final udpSocket = await RawDatagramSocket.bind(address, port);
    return DummyServer._(tcpSocket, udpSocket, password);
  }

  static const _eq = IterableEquality<int>();
  static const _emptyPacket = [0xFF, 0xFF, 0xFF, 0xFF];
  static const _challengePacket = [0xA1, 0xD4, 0x87, 0xE2];

  Future<void> close() async {
    udpSocket.close();
    await tcpSocket.close();
  }

  /* UDP SECTION - QUERY */
  void onQueryData(RawSocketEvent event) {
    final datagram = udpSocket.receive();
    if (datagram == null) {
      return;
    }

    final bytes = datagram.data;
    final packet = QueryPacket(bytes);

    if (bytes.length < 5) {
      return;
    }

    if (!_eq.equals(bytes.sublist(0, 4), _emptyPacket)) {
      return;
    }

    final header = bytes[4];

    // A2S_INFO
    if (QueryPacket.info == packet) {
      udpSocket.send(infoReply, datagram.address, datagram.port);
      return;
    }

    // A2S_PLAYERS
    if (header == 0x55) {
      if (bytes.length != 9) {
        return;
      }
      final challenge = bytes.sublist(5, 9);
      if (_eq.equals(challenge, _emptyPacket)) {
        udpSocket.send(challengeReply, datagram.address, datagram.port);
        return;
      }
      if (_eq.equals(challenge, _challengePacket)) {
        udpSocket.send(playersReply, datagram.address, datagram.port);
        return;
      }
      return;
    }

    // A2S_RULES
    if (header == 0x56) {
      if (bytes.length != 9) {
        return;
      }
      final challenge = bytes.sublist(5, 9);
      if (_eq.equals(challenge, _emptyPacket)) {
        udpSocket.send(challengeReply, datagram.address, datagram.port);
        return;
      }
      if (_eq.equals(challenge, _challengePacket)) {
        udpSocket.send(rulesReply, datagram.address, datagram.port);
        return;
      }
      return;
    }
  }

  late final List<int> infoReply = _getInfoReply();
  late final List<int> playersReply = _getPlayersReply();
  late final List<int> rulesReply = _getRulesReply();

  final List<int> challengeReply = [..._emptyPacket, 0x41, ..._challengePacket];

  List<int> _getInfoReply() {
    final write = WriteBuffer(153, fixedSize: true);

    write.writeUint8(0xFF);
    write.writeUint8(0xFF);
    write.writeUint8(0xFF);
    write.writeUint8(0xFF);
    write.writeUint8(0x49); // Header

    write.writeUint8(17); // Protocol
    write.writeString('Dummy server! - Join here!'); // Name
    write.writeString('de_dust2'); // Map
    write.writeString('csgo'); // Folder
    write.writeString('Counter-Strike: Global Offensive'); // Game name
    write.writeUint16(730); // Game id
    write.writeUint8(16); // Players
    write.writeUint8(64); // Max Players
    write.writeUint8(5); // Bots
    write.writeUint8(ServerType.dedicated.code); // Type
    write.writeUint8(ServerOS.linux.code); // OS
    write.writeUint8(ServerVisibility.public.code); // Visibility
    write.writeUint8(ServerVAC.secured.code); // Vac
    write.writeString('1.37.9.4'); // Version
    write.writeUint8(0xF1); // Extra Data Flags

    write.writeUint16(27015); // Port
    write.writeInt64(10000000000000000); // Steamid
    write.writeUint16(27016); // TV port
    write.writeString('Source TV'); // TV name
    write.writeString('hello,world,nice,server'); // Keywords
    write.writeUint64(730); // Game64 id

    return write.data.buffer.asUint8List();
  }

  List<int> _getPlayersReply() {
    final write = WriteBuffer(0);
    const players = 16;

    write.writeUint8(0xFF);
    write.writeUint8(0xFF);
    write.writeUint8(0xFF);
    write.writeUint8(0xFF);
    write.writeUint8(0x44); // Header

    write.writeUint8(players); // Players
    for (var i = 0; i < players; i++) {
      write.writeUint8(0); // Index
      write.writeString('Player - $i'); // Name
      write.writeInt32(i * 3); // Score
      write.writeFloat32(i * 5); // Connection time
    }

    return write.data.buffer.asUint8List();
  }

  List<int> _getRulesReply() {
    final write = WriteBuffer(0);
    const rules = 8;

    write.writeUint8(0xFF);
    write.writeUint8(0xFF);
    write.writeUint8(0xFF);
    write.writeUint8(0xFF);
    write.writeUint8(0x45); // Header

    write.writeUint16(rules); // Rules
    for (var i = 0; i < rules; i++) {
      write.writeString('rule_$i'); // Name
      write.writeString('value_$i'); // Value
    }

    return write.data.buffer.asUint8List();
  }

  /* TCP SECTION - RCON */
  final Map<InternetAddress, bool> authStatus = <InternetAddress, bool>{};

  void newSocket(Socket socket) {
    authStatus[socket.address] = false;

    socket.listen(
      (data) => onRconData(socket, data),
      onDone: () {
        authStatus.remove(socket.address);
      },
    );
  }

  Future<void> onRconData(Socket socket, Uint8List data) async {
    if (data.length < 14) {
      return;
    }

    final packet = RconPacket(data);

    if (packet.size + 4 != data.length) {
      return;
    }

    // Auth
    if (packet.type == 3) {
      socket.add(RconPacket.from(id: packet.id).bytes);
      if (password.isNotEmpty && password == packet.bodyAsString) {
        // Workaround to avoid this and the previous packet to be added to the same packet.
        await Future(
          () => socket.add(RconPacket.from(id: packet.id, type: 2).bytes),
        );
        authStatus[socket.address] = true;
      } else {
        await Future(
          () => socket.add(RconPacket.from(id: 0xFFFFFFFF, type: 2).bytes),
        );
      }
      return;
    }

    if (packet.type == 2) {
      if (authStatus[socket.address] != true) {
        socket.add(RconPacket.from(id: packet.id).bytes);
        return;
      }

      final body = packet.bodyAsString;
      final args = body.split(RegExp(r'\s+'));

      // The only valid command
      if (args[0] != 'echo') {
        socket.add(
          RconPacket.from(
            id: packet.id,
            body: 'Unknown command "${args[0]}"\n',
          ).bytes,
        );
        return;
      }

      socket.add(
        RconPacket.from(
          id: packet.id,
          body: '${args.sublist(1).join(' ')} \n',
        ).bytes,
      );
    }
  }
}
