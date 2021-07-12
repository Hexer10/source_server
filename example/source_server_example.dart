// ignore_for_file: avoid_print

import 'package:source_server/source_server.dart';

Future<void> main() async {
  final server = await SourceServer.connect('127.0.0.1', 27015);

  final players = await server.getPlayers();
  print(players);

  final rules = await server
      .getRules(); // Note: this doesn't work in CS:GO, unless you have a specific SourceMod plugin installed.
  print(rules);

  final status = await server.command('status');
  print(status);

  server.close();
}
