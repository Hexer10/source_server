/// Wrapper for the server VAC status.
class ServerVAC {
  /// VAC Disabled
  static const ServerVAC unsecured = ServerVAC._(0);

  /// Secure VAC server
  static const ServerVAC secured = ServerVAC._(1);

  /// The [ServerVAC] as raw int.
  final int code;

  /// Initialize an instance of [ServerVAC] from a [code].
  factory ServerVAC(int code) {
    if (code == 0) {
      return unsecured;
    }
    if (code == 1) {
      return secured;
    }
    throw ArgumentError.value(code, 'code', 'Invalid server vac');
  }

  const ServerVAC._(this.code);

  @override
  String toString() {
    switch (this) {
      case unsecured:
        return 'ServerVAC(unsecured)';
      case secured:
        return 'ServerVAC(secured)';
      default:
      // Never reaches here.
        throw StateError('');
    }
  }
}
