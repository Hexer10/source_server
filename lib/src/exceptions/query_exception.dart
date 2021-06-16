import '../../source_server.dart';

/// Exceptions thrown when the [QuerySocket] fails.
class QueryException implements Exception {
  /// Exception description.
  final String message;

  /// Initialize an instance of [QueryException]
  const QueryException(this.message);

  @override
  String toString() => 'RconException: $message';
}
