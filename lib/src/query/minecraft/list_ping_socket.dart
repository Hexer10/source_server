import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:logging/logging.dart';

import '../../buffer.dart';
import 'models/server_ping_info.dart';

/// Allows the connection to a remote server using the rcon protocol.
/// If the current ip address is banned no reply will be sent and the authentication will hang forever.
abstract class ListPingSocket {
  factory ListPingSocket._(Socket socket) = _ListPingSocket;

  /// Fetches the server info such a the MOTD, total number of players and other.
  /// Note: After this method is run the connection to the socket is closed, and the result is cached.
  ///       if you want to refresh the result you should create a new socket connection.
  Future<ServerPingInfo> getPingInfo();

  /// Closes the connection
  void close();

  /// Setup the connection to the remote server.
  static Future<ListPingSocket> connect(dynamic address, int port) async {
    assert(address is String || address is InternetAddress);
    final socket = await Socket.connect(address, port);
    return ListPingSocket._(socket);
  }
}

class _ListPingSocket implements ListPingSocket {
  late final Logger logger =
      Logger('ListPingSocket(${socket.address.address}:${socket.port})');

  final Socket socket;
  final StringBuffer buffer = StringBuffer();

  Completer<ServerPingInfo>? infoCompleter;

  _ListPingSocket(this.socket) {
    socket.listen(onEvent);
  }

  @override
  void close() {
    socket.destroy();
  }

  void onEvent(Uint8List event) {
    logger.fine('Received packet(${event.length}):\n$event\n');
    final size = _readVarInt(event);

    final id = _readVarInt(event.skip(size.length));
    if (id.value == -1) {
      throw Exception('Premature end of stream.');
    }

    final length = _readVarInt(event.skip(id.length + size.length));
    if (length.value == -1) {
      throw Exception('Premature end of stream.');
    }

    if (length.value == 0) {
      throw Exception('Invalid string length');
    }

    final str =
        String.fromCharCodes(event, id.length + size.length + length.length);

    buffer.write(str);

    if (str.endsWith('}')) {
      final decoded = json.decode(buffer.toString()) as Map<String, dynamic>;
      if ((decoded['translate'] as String?)?.contains('disconnect') ?? false) {
        throw SocketException('${decoded['translate']}: ${decoded['with']}');
      }

      final info = ServerPingInfo.fromJson(decoded);
      infoCompleter!.complete(info);
      socket.close();
    }
  }

  @override
  Future<ServerPingInfo> getPingInfo() {
    if (infoCompleter != null) {
      return infoCompleter!.future;
    }

    infoCompleter = Completer<ServerPingInfo>();

    final write = WriteBuffer(15);
    write.writeUint8(0x00);
    write.writeBytes(_writeVarNumber(4));
    write.writeBytes(_writeVarNumber(socket.address.address.length));
    write.writeBytes(socket.address.address.codeUnits);
    write.writeUint16(socket.remotePort, Endian.big);
    write.writeBytes(_writeVarNumber(1));

    final decoded = write.data.buffer.asUint8List();
    final packet = [..._writeVarNumber(decoded.length), ...decoded, 0x01, 0x00];

    socket.add(packet);
    return infoCompleter!.future;
  }
}

_VarInt _readVarInt(Iterable<int> bytes) {
  var decodedInt = 0;
  var bitOffset = 0;
  var length = 0;

  for (final byte in bytes) {
    length++;
    decodedInt |= (byte & 127) << bitOffset;

    if (bitOffset == 35) throw Exception('VarInt is too big');
    if ((byte & 128) == 0) {
      break;
    }
    bitOffset += 7;
  }

  return _VarInt(decodedInt, length);
}

List<int> _writeVarNumber(int value) {
  final bytes = <int>[];

  for (;;) {
    if ((value & 0xFFFFFF80) == 0) {
      bytes.add(value);
      return bytes;
    }

    bytes.add(value & 0x7F | 0x80);
    // ignore: parameter_assignments
    value >>>= 7;
  }
}

class _VarInt {
  final int value;
  final int length;

  const _VarInt(this.value, this.length);
}
