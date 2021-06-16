import '../../source_server.dart';

/// Exceptions thrown when the [RconSocket] fails.
class RconException implements Exception {
  /// Exception description.
  final String message;

  /// Initialize an instance of [QueryException].
  const RconException(this.message);

  @override
  String toString() => 'RconException: $message';
}

/// Exceptions thrown when the authentication with the [RconSocket] fails.
class RconAuthenticationException implements RconException {
  @override
  final String message;

  /// Initialize an instance of [RconAuthenticationException].
  const RconAuthenticationException(this.message);

  @override
  String toString() => 'RconAuthenticationException: $message';
}
