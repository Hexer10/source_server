import 'dart:io';

import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:source_server/source_server.dart';
import 'package:source_server/src/query/query_packet.dart';
import 'package:source_server/src/buffer.dart';

class DummyServer {
  final RawDatagramSocket udpSocket;
  final ServerSocket tcpSocket;

  DummyServer._(this.tcpSocket, this.udpSocket) {
    udpSocket.listen(onQueryData);
    tcpSocket.listen(newSocket);
  }

  static Future<DummyServer> bind(dynamic address,
      {int port = 27015, String rconPsw = ''}) async {
    final tcpSocket = await ServerSocket.bind(address, port);
    final udpSocket = await RawDatagramSocket.bind(address, port);
    return DummyServer._(tcpSocket, udpSocket);
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

    if (!_eq.equals(bytes.sublist(0,4), _emptyPacket)) {
      return;
    }

    final header = bytes[4];

    if (QueryPacket.info == packet) {
      udpSocket.send(infoReply, datagram.address, datagram.port);
      return;
    }

    if (QueryPacket.challenge == packet) {
      udpSocket.send(getChallengeReply(), datagram.address, datagram.port);
      return;
    }

    if (header == 0x55) {
      if (bytes.length != 9) {
        return;
      }
      final challenge = bytes.sublist(5, 9);
      if (_eq.equals(challenge, _emptyPacket)) {
        udpSocket.send(getChallengeReply(), datagram.address, datagram.port);
        return;
      }
      if (_eq.equals(challenge, _challengePacket)) {
        // Send player list
      }
      return;
    }
  }

  late final List<int> infoReply = _getInfoReply();

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

  List<int> getChallengeReply() {
    return
        const [..._emptyPacket, 0x41, ..._challengePacket];
  }

  /* TCP SECTION - RCON */
  final Map<InternetAddress, bool> authStatus = <InternetAddress, bool>{};

  void newSocket(Socket socket) {
    authStatus[socket.address] = false;

    socket.listen((data) => onRconData(socket, data),
        onDone: () => authStatus.remove(socket.address));
  }

  void onRconData(Socket socket, Uint8List data) {
    print(data);
  }
}
