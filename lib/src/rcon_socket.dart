library source_server.rcon;

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

/// RCON Protocol
class RconSocket {
  static const _SERVERDATA_AUTH = 3;
  static const _SERVERDATA_EXECCOMMAND = 2;
  static const _SERVERDATA_AUTH_RESPONSE = 2;
  static const _SERVERDATA_RESPONSE_VALUE = 0;

  final InternetAddress address;
  final int port;
  final String password;

  int _packetId = 0;
  int _count = 0;

  Socket _socket;

  final _queue = Queue<Completer<String>>();

  RconSocket(this.address, this.port, this.password);

  Future<void> connect() async {
    _socket = await Socket.connect(address, port);
    _socket.listen(_onData, onDone: _onDone);
    _authenticate(password);
  }

  void _onDone() {
    _socket = null;
  }

  Future<void> _onData(List<int> data) async {
    //Skip the first packet
    if (++_count == 1) {
      return;
    }

    var bdata = ByteData.view(Int8List.fromList(data).buffer);
    var packetId = bdata.getInt32(4, Endian.little);
    var packetType = bdata.getInt32(8, Endian.little);

    switch (packetType) {
      case _SERVERDATA_AUTH_RESPONSE:
        {
          if (packetId == -1) {
            throw Exception('Authentication failed!');
          }

          break;
        }
      case _SERVERDATA_RESPONSE_VALUE:
        {
          var body = ascii.decode(data.sublist(9));
          _queue.removeFirst().complete(body);
          break;
        }
      default:
        {
          throw Exception('Invalid packet: $packetType!');
        }
    }
  }

  void _authenticate(String password) => _write(_SERVERDATA_AUTH, password);

  Future<String> send(String command) =>
      _write(_SERVERDATA_EXECCOMMAND, command);

  Future<String> _write(int packetType, String body) {
    List<int> asciiBody = ascii.encode(body);
    final size = asciiBody.length + 13;
    var data = ByteData(size);
    data.setInt32(0, size - 4, Endian.little);
    data.setInt32(4, ++_packetId, Endian.little);
    data.setInt32(8, packetType, Endian.little);
    _setList(data, asciiBody, 12);
    _socket.add(data.buffer.asInt8List());

    if (packetType == _SERVERDATA_AUTH) {
      return null;
    }

    var completer = Completer<String>();
    _queue.add(completer);
    return completer.future;
  }

  void close() => _socket.destroy();

  void _setList(ByteData data, Iterable<int> list, int pos) {
    for (var e in list) {
      // ignore: parameter_assignments
      data.setInt8(pos++, e);
    }
  }
}