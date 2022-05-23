// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:typed_data';

class ReadBuffer {
  int _pos = 0;
  final ByteData data;
  Endian endian;

  ReadBuffer(this.data, [this.endian = Endian.little]);

  ReadBuffer.fromUint8List(Uint8List list, [this.endian = Endian.little])
      : data = ByteData.view(list.buffer);

  int get uint8 => data.getUint8(_pos++);

  int get int8 => data.getInt8(_pos++);

  int get uint16 {
    final val = data.getUint16(_pos, endian);
    _pos += 2;
    return val;
  }

  int get int16 {
    final val = data.getInt16(_pos, endian);
    _pos += 2;
    return val;
  }

  int get uint32 {
    final val = data.getUint32(_pos, endian);
    _pos += 4;
    return val;
  }

  int get int32 {
    final val = data.getInt32(_pos, endian);
    _pos += 4;
    return val;
  }

  int get uint64 {
    final val = data.getUint64(_pos, endian);
    _pos += 8;
    return val;
  }

  int get int64 {
    final val = data.getInt64(_pos, endian);
    _pos += 8;
    return val;
  }

  double get float32 {
    final val = data.getFloat32(_pos, endian);
    _pos += 4;
    return val;
  }

  double get float64 {
    final val = data.getFloat64(_pos, endian);
    _pos += 8;
    return val;
  }

  int peek(int pos) => data.getUint8(_pos + pos);

  void skip(int count) => _pos += count;

  String get string {
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

class WriteBuffer {
  int _pos = 0;

  final bool fixedSize;
  final int startSize;

  late ByteData data;

  WriteBuffer(this.startSize, {this.fixedSize = false})
      : data = ByteData(startSize);

  int _checkSize(int length, {bool updatePos = true}) {
    final oldPos = _pos;
    if (_pos >= data.lengthInBytes) {
      if (fixedSize) {
        throw RangeError.value(length);
      } else {
        final l = data.buffer
            .asUint8List()
            .followedBy(List.generate(length, (index) => 0))
            .toList();
        data = ByteData.view(Uint8List.fromList(l).buffer);
      }
    }

    if (updatePos) {
      _pos += length;
    }
    return oldPos;
  }

  void writeUint8(int value) {
    final pos = _checkSize(1);
    data.setUint8(pos, value);
  }

  void writeInt8(int value) {
    final pos = _checkSize(1);
    data.setInt8(pos, value);
  }

  void writeUint16(int value, [Endian endian = Endian.little]) {
    final pos = _checkSize(2);
    data.setUint16(pos, value, endian);
  }

  void writeInt16(int value) {
    final pos = _checkSize(2);
    data.setInt16(pos, value, Endian.little);
  }

  void writeUint32(int value) {
    final pos = _checkSize(4);
    data.setUint32(pos, value, Endian.little);
  }

  void writeInt32(int value) {
    final pos = _checkSize(4);
    data.setInt32(pos, value, Endian.little);
  }

  void writeUint64(int value, [Endian endian = Endian.little]) {
    final pos = _checkSize(8);
    data.setUint64(pos, value, endian);
  }

  void writeInt64(int value) {
    final pos = _checkSize(8);
    data.setInt64(pos, value, Endian.little);
  }

  void writeFloat32(double value) {
    final pos = _checkSize(4);
    data.setFloat32(pos, value, Endian.little);
  }

  void writeFloat64(double value) {
    final pos = _checkSize(8);
    data.setFloat64(pos, value, Endian.little);
  }

  void writeString(String value, {bool nullTerminated = true}) {
    final str = utf8.encode(value);
    _checkSize(str.length + (nullTerminated ? 1 : 0), updatePos: false);
    for (final v in str) {
      writeUint8(v);
    }
    if (nullTerminated) {
      writeUint8(0);
    }
  }

  void writeBytes(List<int> bytes) {
    _checkSize(bytes.length, updatePos: false);
    for (final byte in bytes) {
      writeUint8(byte);
    }
  }
}
