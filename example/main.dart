import '../lib/source_server.dart';

void main() async {
    //By default the IP is: localhost and port: 27015 .
    SourceServer rcon = new SourceServer('foo');
    //Attempt to connect.
    await rcon.connect();
    //Print the 'status' reply.
    print(await rcon.command('status'));

    //Print all players name.
    var players = await rcon.getPlayers();
    players.forEach((player) {
        print(player.name);
    });

    //Print server info.
    print(await rcon.getServerInfo());
}