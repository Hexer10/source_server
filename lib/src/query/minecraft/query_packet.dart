import 'package:collection/collection.dart';

///
class QueryPacket {
  ///
  static const List<int> magic = [0xfe, 0xfd];

  ///
  static const QueryPacket challenge =
      QueryPacket([...magic, 0x09, 0x00, 0x00, 0x00, 0x01]);

  ///
  final List<int> bytes;

  ///
  const QueryPacket(this.bytes);

  ///
  QueryPacket.info(List<int> challenge)
      : bytes = [...magic, 0x00, 0x00, 0x00, 0x00, 0x01, ...challenge];

  ///
  QueryPacket.fullInfo(List<int> challenge)
      : bytes = [
          ...magic,
          0x00,
          0x00,
          0x00,
          0x00,
          0x01,
          ...challenge,
          0x00,
          0x00,
          0x00,
          0x00
        ];

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
