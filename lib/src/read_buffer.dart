// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:typed_data';

class ReadBuffer {
  int _pos = 0;
  final ByteData data;

  ReadBuffer(this.data);

  ReadBuffer.fromUint8List(Uint8List list) : data = ByteData.view(list.buffer);

  int get uint8 => data.getUint8(_pos++);

  int get int8 => data.getInt8(_pos++);

  int get uint16 {
    final val = data.getUint16(_pos, Endian.little);
    _pos += 2;
    return val;
  }

  int get int16 {
    final val = data.getInt16(_pos, Endian.little);
    _pos += 2;
    return val;
  }

  int get uint32 {
    final val = data.getUint32(_pos, Endian.little);
    _pos += 4;
    return val;
  }

  int get int32 {
    final val = data.getInt32(_pos, Endian.little);
    _pos += 4;
    return val;
  }

  int get uint64 {
    final val = data.getUint64(_pos, Endian.little);
    _pos += 8;
    return val;
  }

  int get int64 {
    final val = data.getInt64(_pos, Endian.little);
    _pos += 8;
    return val;
  }

  double get float32 {
    final val = data.getFloat32(_pos, Endian.little);
    _pos += 4;
    return val;
  }

  double get float64 {
    final val = data.getFloat64(_pos, Endian.little);
    _pos += 8;
    return val;
  }

  String get readString {
    final bytes = <int>[];
    for (var val = uint8;; val = uint8) {
      if (val == 0) {
        break;
      }
      bytes.add(val);
    }
    return utf8.decode(bytes);
  }

  bool get canReadMore => _pos < data.lengthInBytes;
}
