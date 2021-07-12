// ignore_for_file: avoid_print

import 'package:source_server/source_server.dart';

Future<void> main() async {
  final server = await SourceServer.connect('192.168.122.1', 27015);

  final info = await server.getInfo();
  print(info);

  final info2 = await server.getInfo();
  print(info2);

  final pg = await server.getPlayers();
  print(pg);

  final info3 = await server.getInfo();
  print(info3);

  final pg2 = await server.getPlayers();
  print(pg2);

  final pg3 = await server.getRules();
  print(pg3);

  final info4 = await server.getInfo();
  print(info4);

/*  final players = await server.getPlayers();
  print(players);

  final rules = await server.getRules();
  print(rules);

  final status = await server.command('status');
  print(status);*/

  server.close();
}
