import 'package:source_server/source_server.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'dummy_server.dart';

void main() {
  // This test uses the following ports: 9123 - 9127
  group('Test query client', () {
    late DummyServer dummy;
    late SourceServer server;

    setUpAll(() async {
      dummy = await DummyServer.bind('127.0.0.1', port: 9123);
      server = await SourceServer.connect('127.0.0.1', 9123);
    });

    tearDownAll(() async {
      server.close();
      await dummy.close();
    });

    test('getInfo returns correct info', () async {
      final info = await server.getInfo();

      expect(info, isA<ServerInfo>());

      expect(info.protocol, 17);
      expect(info.name, 'Dummy server! - Join here!');
      expect(info.map, 'de_dust2');
      expect(info.folder, 'csgo');
      expect(info.id, 730);
      expect(info.players, 16);
      expect(info.maxPlayers, 64);
      expect(info.bots, 5);
      expect(info.type, ServerType.dedicated);
      expect(info.os, ServerOS.linux);
      expect(info.visibility, ServerVisibility.public);
      expect(info.vac, ServerVAC.secured);
      expect(info.version, '1.37.9.4');
      expect(info.port, 27015);
      expect(info.steamId, 10000000000000000);
      expect(info.tvPort, 27016);
      expect(info.tvName, 'Source TV');
      expect(info.keywords, 'hello,world,nice,server');
      expect(info.gameId, 730);
    });

    test('getPlayers returns correct players', () async {
      final players = await server.getPlayers();

      expect(players, isA<List<QueryPlayer>>());

      expect(players, hasLength(16));

      final secondPlayer = players[1];
      expect(secondPlayer.index, 0);
      expect(secondPlayer.name, 'Player - 1');
      expect(secondPlayer.score, 3);
      expect(secondPlayer.duration, 5);
    });

    test('getReturns returns correct rules', () async {
      final rules = await server.getRules();

      expect(rules, isA<List<ServerRule>>());

      expect(rules, hasLength(8));

      final rule = rules.first;
      expect(rule.name, 'rule_0');
      expect(rule.value, 'value_0');
    });
  });

  group('Test RCON client', () {
    test('Valid RCON password', () async {
      final dummy =
          await DummyServer.bind('127.0.0.1', port: 9124, password: '1234');
      expect(
          await SourceServer.connect('127.0.0.1', 9124, password: '1234')
            ..close(),
          isA<SourceServer>());

      await dummy.close();
    });

    test('Invalid RCON password', () async {
      final dummy =
          await DummyServer.bind('127.0.0.1', port: 9125, password: '1234');
      await expectLater(
          () async =>
              await SourceServer.connect('127.0.0.1', 9125, password: '12345')
                ..close(),
          throwsA(isA<RconAuthenticationException>()));
      await dummy.close();
    });

    test('Correct RCON commands', () async {
      final dummy =
          await DummyServer.bind('127.0.0.1', port: 9126, password: '1234');
      final server =
          await SourceServer.connect('127.0.0.1', 9126, password: '1234');

      await expectLater(server.command('echo a'), completion('a \n'));
      await expectLater(server.command('hello world'),
          completion('Unknown command "hello"\n'));

      server.close();
      await dummy.close();
    });

    test('Throws if not authenticated', () async {
      final dummy =
          await DummyServer.bind('127.0.0.1', port: 9127, password: '1234');
      final server = await SourceServer.connect('127.0.0.1', 9127);

      await expectLater(
          () => server.command('echo a'), throwsA(isA<RconException>()));

      server.close();
      await dummy.close();
    });
  });
}
