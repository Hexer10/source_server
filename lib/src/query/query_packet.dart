import 'dart:typed_data';

import 'package:collection/collection.dart';

///
class QueryPacket {
  ///
  static const QueryPacket info = QueryPacket([
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
    0x00
  ]);

  ///
  static const QueryPacket challenge =
      QueryPacket([0xff, 0xff, 0xff, 0xff, 0x55, 0xff, 0xff, 0xff, 0xff]);

  ///
  final List<int> bytes;

  ///
  const QueryPacket(this.bytes);

  ///
  QueryPacket.players(Uint8List challenge)
      : bytes = [0xff, 0xff, 0xff, 0xff, 0x55, ...challenge];

  ///
  QueryPacket.rules(Uint8List challenge)
      : bytes = [0xff, 0xff, 0xff, 0xff, 0x56, ...challenge];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is QueryPacket) {
      return const IterableEquality<int>().equals(bytes, other.bytes);
    }
    return false;
  }

  @override
  int get hashCode => bytes.hashCode;
}
