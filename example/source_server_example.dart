import 'package:source_server/source_server.dart';

Future<void> main() async {
  final server =
      await SourceServer.connect('127.0.0.1', 27015, password: '1234');

  // You should manually add a timeout to all of this functions such as `server.getInfo().timeout(...)`
  final info = await server.getInfo();
  final players = await server.getPlayers();
  final rules = await server.getRules();
  final status = await server.command('status');

  print(info);
  print(players);
  print(rules);
  print(status);

  server.close();
}
