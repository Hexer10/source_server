import 'package:test/test.dart';

import 'package:source_server/source_server.dart';

void main() async {
  // Make sure to run any source server on your local machine
  // and put correct ip, port and rcon password
  const svIp = '127.0.0.1';
  const svPort = 27015;
  const svRconPass = 'ciao';

  final server =
    await SourceServer.connect(svIp, svPort, password: svRconPass);

  test('Get Server Info', () async {
    final info = await server.getInfo();
    expect(info, isNotNull);
  });

  test('Get Server Players', () async {
    final players = await server.getPlayers();
    expect(players, isA<List<QueryPlayer>>());
  });

  test('Get Server Rules', () async {
    final rules = await server.getRules();
    expect(rules, isNotNull);
  });

  test('Test Custom Command', () async {
    final status = await server.command('status');
    expect(status, isA<String>());
  });
}
