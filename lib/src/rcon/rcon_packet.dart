// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:typed_data';

/*
3: SERVERDATA_AUTH
2: SERVERDATA_EXECCOMMAND
2: SERVERDATA_AUTH_RESPONSE
0: SERVERDATA_RESPONSE_VALUE
 */
class RconPacket {
  final Uint8List bytes;

  late final ByteData _byteData;

  int get size => _byteData.getInt32(0, Endian.little);

  int get id => _byteData.getInt32(4, Endian.little);

  int get type => _byteData.getInt32(8, Endian.little);

  Uint8List get body => bytes.sublist(12, bytes.length - 2);

  String get bodyAsString => utf8.decode(body, allowMalformed: true);

  bool get terminated => bytes.last == 0x00 && bytes[bytes.length -2] == 0x00;

  RconPacket(this.bytes) : _byteData = ByteData.view(bytes.buffer);

  factory RconPacket.from({
    int id = 0,
    int type = 0,
    dynamic body = const [0x00],
  }) {
    assert((body is List<int> && body.isNotEmpty) || body is String);
    if (body is String) {
      body = [...utf8.encode(body), 0x00];
    }
    if (body is List<int>) {
      final size = 4 + 4 + body.length + 1;
      final bytes = ByteData(size + 4);

      var offset = 0;
      bytes.setInt32(offset, size, Endian.little);
      offset += 4;

      bytes.setInt32(offset, id, Endian.little);
      offset += 4;

      bytes.setInt32(offset, type, Endian.little);
      offset += 4;

      bytes.setList(offset, body);

      return RconPacket(bytes.buffer.asUint8List());
    }
    throw ArgumentError.value(body, 'body', 'Invalid type');
  }

  factory RconPacket.auth({required String password, required int id}) {
    return RconPacket.from(body: password, type: 3, id: id);
  }

  factory RconPacket.command({required String command, required int id}) {
    return RconPacket.from(body: command, type: 2, id: id);
  }

  /// Used only to add content to body when receiving multi-packets replies.
  RconPacket expandBody(Iterable<int> content) {
    assert(!terminated);
    return RconPacket(Uint8List.fromList([...bytes, ...content]));
  }
}

extension on ByteData {
  void setList(int byteOffset, List<int> value) {
    for (var i = 0; i < value.length; i++) {
      setUint8(byteOffset + i, value[i]);
    }
  }
}
