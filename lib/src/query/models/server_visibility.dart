/// Wrapper for the server visibility.
class ServerVisibility {
  /// Public - Not password protected.
  static const ServerVisibility public = ServerVisibility._(0);

  /// Private - Password protected.
  static const ServerVisibility private = ServerVisibility._(1);

  /// The [ServerVisibility] as raw int.
  final int code;

  /// Initialize an instance of [ServerVisibility] from a [code].
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

  @override
  String toString() {
    switch (this) {
      case public:
        return 'ServerVisibility(public)';
      case private:
        return 'ServerVisibility(private)';
      default:
      // Never reaches here.
        throw StateError('');
    }
  }
}
