import 'package:source_server/source_server.dart';

void main() async {

    //By default the IP is: localhost and port: 27015 .
    SourceServer rcon = new SourceServer('foo');
    //Attempt to connect.
    await rcon.connect();
    //Print the 'status' reply.
    print(await rcon.command('status'));
}