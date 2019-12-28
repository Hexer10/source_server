part of '../server.dart';

abstract class BaseSocket<T extends Stream> {
  T _socket;
  final InternetAddress address;
  final int port;

  BaseSocket(this.address, this.port);

  Future<void> connect();

  FutureOr<void> close() async {
    if (_socket is RawDatagramSocket) {
      (_socket as RawDatagramSocket).close();
    } else if (_socket is Socket) {
      (_socket as Socket).destroy();
    } else {
      throw ArgumentError.value(
          _socket, '_socket', 'Must be either RawDataGramSocket or Socket');
    }
  }
}
