import 'dart:io';

import 'package:source_server/source_server.dart';

Future<void> main() async {
  var query = SourceServer(InternetAddress('127.0.0.1'), 27015, 'mypassword');
  await query.connect();
  print(await query.getStatus());
}
