import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_ping_info.freezed.dart';

part 'server_ping_info.g.dart';

/// Server info fetched using the `Server List Ping` interface.
@freezed
class ServerPingInfo with _$ServerPingInfo {
  /// Server info.
  const factory ServerPingInfo({
    /// Server and protocol version.
    required Version version,

    /// Total and connected players.
    required Players players,

    /// MOTD description.
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _descriptionToJson) required Description description,

    /// Favicon data uri.
    String? favicon,

    /// Server's mods.
    Modinfo? modinfo,

    /// Server's ping.
    int? ping,
  }) = _ServerPingInfo;

  ///
  factory ServerPingInfo.fromJson(Map<String, dynamic> json) =>
      _$ServerPingInfoFromJson(json);
}

/// MOTD description.
@freezed
class Description with _$Description {
  /// MOTD description.
  const factory Description({
    /// Extra MOTD text.
    List<Extra>? extra,

    /// Motd text.
    required String text,
  }) = _Description;

  ///
  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
}

/// Extra MOTD text.
@freezed
class Extra with _$Extra {
  /// Extra MOTD text.
  const factory Extra({
    /// Text color.
    String? color,

    /// Actual text.
    required String text,

    /// Bold text.
    bool? bold,

    /// Strikethrough text.
    bool? strikethrough,

    /// Italic text.
    bool? italic,

    /// Underlined text.
    bool? underlined,
  }) = _Extra;

  ///
  factory Extra.fromJson(Map<String, dynamic> json) => _$ExtraFromJson(json);
}

/// Server's mods.
@freezed
class Modinfo with _$Modinfo {
  /// Server's mods.
  const factory Modinfo({
    /// Mods type.
    required String type,

    /// Mods list.
    required List<Mod> modList,
  }) = _Modinfo;

  ///
  factory Modinfo.fromJson(Map<String, dynamic> json) =>
      _$ModinfoFromJson(json);
}

/// Total and connected players.
@freezed
class Players with _$Players {
  /// Total and connected players.
  const factory Players({
    /// Max players.
    required int max,

    /// Connected players.
    required int online,

    /// Connected players list.
    List<Sample>? sample,
  }) = _Players;

  ///
  factory Players.fromJson(Map<String, dynamic> json) =>
      _$PlayersFromJson(json);
}

/// A server's player.
@freezed
class Sample with _$Sample {
  /// A server's player.
  const factory Sample({
    /// Players' UUID.
    required String id,

    /// Players' name.
    required String name,
  }) = _Sample;

  ///
  factory Sample.fromJson(Map<String, dynamic> json) => _$SampleFromJson(json);
}

/// Version name and protocol number.
@freezed
class Version with _$Version {
  /// Version name and protocol number.
  const factory Version({
    /// Version name.
    required String name,

    /// Version protocol.
    required int protocol,
  }) = _Version;

  ///
  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
}

/// Version name and protocol number.
@freezed
class Mod with _$Mod {
  /// Version name and protocol number.
  const factory Mod({
    /// Mod id.
    required String modid,

    /// Mod version.
    required String version,
  }) = _Mod;

  ///
  factory Mod.fromJson(Map<String, dynamic> json) => _$ModFromJson(json);
}

Description _descriptionToJson(dynamic value) {
  if (value is String) {
    return Description(text: value);
  }
  if (value is Map<String, dynamic>) {
    value['text'] ??= value['translate'] ?? '';
    return Description.fromJson(value);
  }
  throw TypeError();
}
