class ServerVisibility {
  /// Public - Not password protected.
  static const ServerVisibility public = ServerVisibility._(0);

  /// Private - Password protected.
  static const ServerVisibility private = ServerVisibility._(1);

  final int code;

  factory ServerVisibility(int code) {
    if (code == 0) {
      return public;
    }
    if (code == 1) {
      return private;
    }
    throw ArgumentError.value(code, 'code', 'Invalid server visibility');
  }

  const ServerVisibility._(this.code);
}
