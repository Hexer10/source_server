# SourceSerer

A library to connect to Source Dedicated Servers [CS:GO, CSS, TF2, ...]

## Get started
Import the library (make sure to check for the latest version).
```yaml
depedencies:
    source_server: ^1.0.0
```
And call the `SourceServer` constructor.

It contains both `RconServer` and `QueryServer` instances, if you wish to use just one protocol you can still use one of those classes.
```dart
// The SourceServer constructor requires an InternetAddress and a port, if you wish to
// use the rcon connection as well you need to provide a password as well.
var server = SourceServer((await InternetAddress.lookup('hexah.net')).first, 27015);
```
The only required parameter is the first, _password_, the _ip_ and _port_ by default are: _localhost:27015_

To establish a connection to the server call the `connect` method. It will return a `Future<void>` that will be completed when the connection to the server is successfully established.

```dart
await server.connect();
```

## Sending commands to the RCON
Use
```dart
var reply = await server.send('status');
```
the method `command` will return a `Future<String>` what will return the command reply.

the `SourceServer` provides also a way to parse the status command.

```dart
var status = wait server.getStatus();
```

Example reply:
```
{
	server: 
	{   
		hostname: Server name, 
		version: 1.36.8.2/13682 886/7424 secure  [G:1:xxxxxxx], 
		udp/ip: xxx.xx.xxx.xx:27015  (public ip: xxx.xx.xxx.xx), 
		os: Linux, 
		type: community dedicated, 
		map: de_mirage, 
		players: 0 humans, 0 bots (16/0 max) (not hibernating)
	}, 
	//If the server is not empty it will return a list containing all the players in the server (and it's info)
	players: []
}

```


## Sending commands using the query protocol

Look in the API documentation for all the available methods, here is an example:
```dart
var info = server.getInfo();
```

Returns a `Future<Map>` holding all the (parsed) server info.

### TODO
   
Check the [issues](https://github.com/Hexer10/SourceServer/issues) page on github
