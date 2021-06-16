# SourceSerer

A library to connect to Source Dedicated Servers [CS:GO, CSS, TF2, ...]

## Get started
Import the library (make sure to check for the latest version).
```yaml
depedencies:
    source_server: ^3.1.0-dev
```

Connect to the server
```dart
  final server = await SourceServer.connect('127.0.0.1', 27015, password: '1234');
```
The password parameter can be supplied to connect via RCON as well.


After connecting you can issue the query commands:
```dart
  final info = await server.getInfo();
  final players = await server.getPlayers();
  final rules = await server.getRules();
```

## Sending RCON commands

The RCON password must be supplied to send RCON commands.

```dart
final reply = await server.command('status');
```
the method `command` will return a `Future` string holding the server reply.