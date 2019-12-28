part of '../server.dart';

enum RconError {
  invalidPacket,
  authenticationFailed,
  noAuthentication
}

enum QueryError {
  noToken
}

class RconException implements Exception {
  final String message;
  final RconError id;

  RconException(this.message, this.id);

  @override
  String toString() => 'RconException: $message ($id)';
}

class QueryException implements Exception {
  final String message;
  final QueryError id;

  QueryException(this.message, this.id);

  @override
  String toString() => 'RconException: $message ($id)';
}