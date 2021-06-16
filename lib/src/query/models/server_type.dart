/// Wrapper for server types.
class ServerType {
  /// Dedicated server
  static const ServerType dedicated = ServerType._(0x64);

  /// Non-dedicated server
  static const ServerType nonDedicated = ServerType._(0x6c);

  /// SourceTV relay (proxy)
  static const ServerType sourceTv = ServerType._(0x70);

  /// The [ServerType] as raw int.
  final int code;

  /// Initialize an instance of [ServerType] from a [code].
  factory ServerType(int code) {
    if (code == 0x64) {
      return dedicated;
    }
    if (code == 0x6c) {
      return nonDedicated;
    }
    if (code == 0x70) {
      return sourceTv;
    }
    throw ArgumentError.value(code, 'code', 'Invalid server type');
  }

  const ServerType._(this.code);
}
