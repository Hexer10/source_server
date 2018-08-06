library source_server;

import 'dart:io';
import 'dart:collection';
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'server_player.dart';

const int SERVERDATA_AUTH = 3;
const int SERVERDATA_AUTH_RESPONSE = 2;
const int SERVERDATA_EXECCOMMAND = 2;
const int SERVERDATA_RESPONSE_VALUE = 0;

/// [SourceServer] is used to connect to Source Dedicated Servers[CSGO, CSS, TF2, ...] using the RCON Protocol.
class SourceServer {
    RawSocket _socket;
    bool _connected = false;
    Queue<Completer<Map<String, dynamic>>> _queue = new Queue();
    List<ServerPlayer> _playersInfo = null;

    String _ip;
    int _port;
    String _password;
    int _id = 1;
    Function _onDoneFunc;

    /// The IP address set with [SourceServer] constructor.
    String get ip => _ip;

    /// The port set with [SourceServer] constructor.
    int get port => _port;

    /// The password set with [SourceServer] constructor.
    String get password => _password;

    /// Construct [SourceServer] class, queries a NON-Empty [password] and optionally an [ip] and/or [port]
    SourceServer(String password, {String ip = 'localhost', int port = 27015}) {
        if (password.isEmpty) {
            throw ('Password is empty!');
        }

        _ip = ip;
        _port = port;
        _password = password;
    }

    /// Connects and authenticates to the remove Source Dedicated Server.
    /// Optionally you can provide [onDone] to be called when the connection is closed.
    Future<Map<String, dynamic>> connect([Function onDone = null]) async {
        _onDoneFunc = onDone;
        _socket = await RawSocket.connect(_ip, _port);
        await _socket.listen(_onData, onError: _onError, onDone: _onDone);
        _connected = true;
        return _write(SERVERDATA_AUTH, _password);
    }

    /// Sends a [command] to the [SourceServer].
    /// Returns a [Future] string containing the server reply.
    Future<String> command(String command) async {
        if (!_connected)
            throw ('The socket isn\'n connected yet!\nYou should use [connect] to do so');

        var reply = await _write(SERVERDATA_EXECCOMMAND, command);
        return reply['body'];
    }

    Future<List<ServerPlayer>> getPlayers() async {
        if (this._playersInfo != null) return _playersInfo;

        List statusAttr = new List();
        List statusHeader = new List();
        _playersInfo = new List();

        String status = await this.command('status');
        await status.split('\n').forEach((element) {
            if (element.indexOf('#') == 0 && element[0] != "#end") {
                statusAttr.add(element.substring(1).trim());
            }
        });

        await statusAttr[0].split(' ').forEach((element) {
            statusHeader.add(element);
        });
        statusAttr.removeAt(0);
        statusAttr.removeLast();

        await statusAttr.forEach((player) {
            Map<String, dynamic> playerInfo = new Map();

            //Get the player name
            int start = player.indexOf('"');
            int end = player.lastIndexOf('"');
            String name = player.substring(start, end).substring(1);

            //Remove the player name from our String
            List info = player.replaceFirst('"$name" ', '').split(' ');

            playerInfo['name'] = name;
            playerInfo['userid'] = int.tryParse(info[0]);

            if (int.tryParse(player.split(' ')[1]) == null) {
                playerInfo['steamid'] = "BOT";
                playerInfo['onlinetime'] = null;
                playerInfo['ping'] = null;
                playerInfo['ip'] = null;
            } else {
                playerInfo['steamid'] = info[2];
                playerInfo['onlinetime'] = info[3];
                playerInfo['ping'] = int.tryParse(info[5]);
                playerInfo['ip'] = info[8];
            }

            _playersInfo.add(new ServerPlayer(playerInfo));
        });
        return _playersInfo;
    }

    Future<Map<String, dynamic>> _write(int type, String body, [int id]) async {
        if (id != null) _id = id;

        //Get the ASCII encoded list.
        var bodyASCII = ascii.encode(body);

        //Get the packet size.
        var size = bodyASCII.length + 14;
        var buffer = new Int8List(size).buffer;
        var bdata = new ByteData.view(buffer);

        bdata.setInt32(0, size - 4, Endian.little); //Byte requests length ).
        bdata.setInt32(4, _id++, Endian.little); //Any integer.
        bdata.setInt32(8, type, Endian.little); //Integer: SERVERDATA_*.
        _setList(12, bdata, bodyASCII);
        bdata.setInt16(size - 2, 0, Endian.little); //Write the null terminators.

        //Write packet to the socket.
        var packet = bdata.buffer.asInt8List();
        await _socket.write(packet, 0, packet.length);

        var completer = new Completer<Map<String, dynamic>>();
        _queue.add(completer);

        //Return the reply.
        return completer.future;
    }

    _onData(var data) async {
        if (data == RawSocketEvent.readClosed) _socket.close();

        //Read the reply.
        List<int> buffer = await _socket.read();
        if (buffer == null || buffer[8] != SERVERDATA_RESPONSE_VALUE) return;

        //Build the map reply.
        Map<String, dynamic> reply = new Map();
        reply['size'] = buffer.first;
        reply['id'] = buffer[4];
        reply['type'] = buffer[8];
        reply['body'] = ascii.decode(
            buffer.getRange(12, buffer.length - 2).toList(),
            allowInvalid: true);
        _queue.removeFirst().complete(reply);
    }

    _onDone() {
        _onDoneFunc();
        _connected = false;
    }

    _onError(var data) {
        print(data);
    }

    _setList(int offset, ByteData bdata, Iterable<int> list) async {
        await list.forEach((element) {
            bdata.setInt8(offset, element);
            offset += 1;
        });
    }
}