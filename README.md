# SourceSerer

A library to connect to Source Dedicated Servers [CS:GO, CSS, TF2, ...]

## Get started
Import the library (make sure to check for the latest version).
```yaml
depedencies:
    source_server: ^0.0.3
```
Then Construct our class.
```dart
var server = new SourceServer('foo', ip: 'localhost', port: 27015);
```
The only required parameter is the first, _password_, the _ip_ and _port_ by default are: _localhost:27015_

Now we can estabilish a connection to server:
```dart
var server;
server.connect();
```
Here you can optionally provive an onDone callback to know when the connection closes.

## Sending commands
Use
```dart
var reply = await server.command('status');
```
the method `command` will return a `Future` string holding the server reply.

### TODO

-   If packet is split in multiple requests return it properly.
-   Allow to get more info about the server and connected players.
-   Add a `status` command parser. 

