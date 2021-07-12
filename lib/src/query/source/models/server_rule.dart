import '../../../source_server.dart';

/// A rule returned by [SourceServer.getRules].
class ServerRule {
  /// Rule name.
  final String name;

  /// Rule value.
  final String value;

  /// Construct a new [ServerRule] from its [name] and [value].
  const ServerRule(this.name, this.value);
}
