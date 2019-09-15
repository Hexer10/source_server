enum RconError {
  invalidPacket,
  authenticationFailed,
  noAuthentication
}

class RconException implements Exception {
  final String message;
  final RconError id;

  RconException(this.message, this.id);

  @override
  String toString() => 'RconException: $message ($id)';
}