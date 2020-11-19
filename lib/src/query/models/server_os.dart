// [0x6c, 0x77, 0x6d, 0x6f]
class ServerOS {
  /// Linux
  static const ServerOS linux = ServerOS._(0x6c);

  /// Windows
  static const ServerOS windows = ServerOS._(0x77);

  /// Mac
  static const ServerOS mac = ServerOS._(0x6d);

  final int code;

  factory ServerOS(int code) {
    if (code == 0x6c) {
      return linux;
    }
    if (code == 0x77) {
      return windows;
    }
    if (code == 0x6d || code == 0x6f) {
      return mac;
    }
    throw ArgumentError.value(code, 'code', 'Invalid server os');
  }

  const ServerOS._(this.code);
}
