/// Wrapper for the server OS.
class ServerOS {
  /// Linux
  static const ServerOS linux = ServerOS._(0x6c);

  /// Windows
  static const ServerOS windows = ServerOS._(0x77);

  /// Mac
  static const ServerOS mac = ServerOS._(0x6d);

  /// The [ServerOS] as raw int.
  final int code;

  /// Initialize an instance of [ServerOS] from a [code].
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
