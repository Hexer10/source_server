class ServerVAC {
  /// VAC Disabled
  static const ServerVAC unsecured = ServerVAC._(0);

  /// Secure VAC server
  static const ServerVAC secured = ServerVAC._(1);

  final int code;

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
}
