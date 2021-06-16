// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'server_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ServerInfoTearOff {
  const _$ServerInfoTearOff();

  _ServerInfo call(
      {required int protocol,
      required String name,
      required String map,
      required String folder,
      required String game,
      required int id,
      required int players,
      required int maxPlayers,
      required int bots,
      required ServerType type,
      required ServerOS os,
      required ServerVisibility visibility,
      required ServerVAC vac,
      required String version,
      int? port,
      int? steamId,
      int? tvPort,
      String? tvName,
      String? keywords,
      int? gameId}) {
    return _ServerInfo(
      protocol: protocol,
      name: name,
      map: map,
      folder: folder,
      game: game,
      id: id,
      players: players,
      maxPlayers: maxPlayers,
      bots: bots,
      type: type,
      os: os,
      visibility: visibility,
      vac: vac,
      version: version,
      port: port,
      steamId: steamId,
      tvPort: tvPort,
      tvName: tvName,
      keywords: keywords,
      gameId: gameId,
    );
  }
}

/// @nodoc
const $ServerInfo = _$ServerInfoTearOff();

/// @nodoc
mixin _$ServerInfo {
  /// Protocol version used by the server.
  int get protocol => throw _privateConstructorUsedError;

  /// Name of the server.
  String get name => throw _privateConstructorUsedError;

  /// Map the server has currently loaded.
  String get map => throw _privateConstructorUsedError;

  /// Name of the folder containing the game files.
  String get folder => throw _privateConstructorUsedError;

  /// Full name of the game.
  String get game => throw _privateConstructorUsedError;

  /// Steam Application ID of game.
  int get id => throw _privateConstructorUsedError;

  /// Number of players on the server.
  int get players => throw _privateConstructorUsedError;

  /// Maximum number of players the server reports it can hold.
  int get maxPlayers => throw _privateConstructorUsedError;

  /// Number of bots on the server.
  int get bots => throw _privateConstructorUsedError;

  /// Server type.
  ServerType get type => throw _privateConstructorUsedError;

  /// Server operating system.
  ServerOS get os => throw _privateConstructorUsedError;

  /// Server visibility. Indicates if the server is password protected.
  ServerVisibility get visibility => throw _privateConstructorUsedError;

  /// Server VAC status.
  ServerVAC get vac =>
      throw _privateConstructorUsedError; /* TODO: Add TheShip flags */
  /// Version of the game installed on the server.
  String get version => throw _privateConstructorUsedError;

  /// Server's port number.
  int? get port => throw _privateConstructorUsedError;

  /// Server's SteamID.
  int? get steamId => throw _privateConstructorUsedError;

  /// Spectator port number for SourceTV.
  int? get tvPort => throw _privateConstructorUsedError;

  /// Name of the spectator server for SourceTV.
  String? get tvName => throw _privateConstructorUsedError;

  /// Tags that describe the game according to the server (for future use.)
  String? get keywords => throw _privateConstructorUsedError;

  /// The server's 64-bit GameID.
  int? get gameId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerInfoCopyWith<ServerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerInfoCopyWith<$Res> {
  factory $ServerInfoCopyWith(
          ServerInfo value, $Res Function(ServerInfo) then) =
      _$ServerInfoCopyWithImpl<$Res>;
  $Res call(
      {int protocol,
      String name,
      String map,
      String folder,
      String game,
      int id,
      int players,
      int maxPlayers,
      int bots,
      ServerType type,
      ServerOS os,
      ServerVisibility visibility,
      ServerVAC vac,
      String version,
      int? port,
      int? steamId,
      int? tvPort,
      String? tvName,
      String? keywords,
      int? gameId});
}

/// @nodoc
class _$ServerInfoCopyWithImpl<$Res> implements $ServerInfoCopyWith<$Res> {
  _$ServerInfoCopyWithImpl(this._value, this._then);

  final ServerInfo _value;
  // ignore: unused_field
  final $Res Function(ServerInfo) _then;

  @override
  $Res call({
    Object? protocol = freezed,
    Object? name = freezed,
    Object? map = freezed,
    Object? folder = freezed,
    Object? game = freezed,
    Object? id = freezed,
    Object? players = freezed,
    Object? maxPlayers = freezed,
    Object? bots = freezed,
    Object? type = freezed,
    Object? os = freezed,
    Object? visibility = freezed,
    Object? vac = freezed,
    Object? version = freezed,
    Object? port = freezed,
    Object? steamId = freezed,
    Object? tvPort = freezed,
    Object? tvName = freezed,
    Object? keywords = freezed,
    Object? gameId = freezed,
  }) {
    return _then(_value.copyWith(
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      map: map == freezed
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as String,
      folder: folder == freezed
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String,
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: maxPlayers == freezed
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      bots: bots == freezed
          ? _value.bots
          : bots // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ServerType,
      os: os == freezed
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as ServerOS,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as ServerVisibility,
      vac: vac == freezed
          ? _value.vac
          : vac // ignore: cast_nullable_to_non_nullable
              as ServerVAC,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      steamId: steamId == freezed
          ? _value.steamId
          : steamId // ignore: cast_nullable_to_non_nullable
              as int?,
      tvPort: tvPort == freezed
          ? _value.tvPort
          : tvPort // ignore: cast_nullable_to_non_nullable
              as int?,
      tvName: tvName == freezed
          ? _value.tvName
          : tvName // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: keywords == freezed
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      gameId: gameId == freezed
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ServerInfoCopyWith<$Res> implements $ServerInfoCopyWith<$Res> {
  factory _$ServerInfoCopyWith(
          _ServerInfo value, $Res Function(_ServerInfo) then) =
      __$ServerInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int protocol,
      String name,
      String map,
      String folder,
      String game,
      int id,
      int players,
      int maxPlayers,
      int bots,
      ServerType type,
      ServerOS os,
      ServerVisibility visibility,
      ServerVAC vac,
      String version,
      int? port,
      int? steamId,
      int? tvPort,
      String? tvName,
      String? keywords,
      int? gameId});
}

/// @nodoc
class __$ServerInfoCopyWithImpl<$Res> extends _$ServerInfoCopyWithImpl<$Res>
    implements _$ServerInfoCopyWith<$Res> {
  __$ServerInfoCopyWithImpl(
      _ServerInfo _value, $Res Function(_ServerInfo) _then)
      : super(_value, (v) => _then(v as _ServerInfo));

  @override
  _ServerInfo get _value => super._value as _ServerInfo;

  @override
  $Res call({
    Object? protocol = freezed,
    Object? name = freezed,
    Object? map = freezed,
    Object? folder = freezed,
    Object? game = freezed,
    Object? id = freezed,
    Object? players = freezed,
    Object? maxPlayers = freezed,
    Object? bots = freezed,
    Object? type = freezed,
    Object? os = freezed,
    Object? visibility = freezed,
    Object? vac = freezed,
    Object? version = freezed,
    Object? port = freezed,
    Object? steamId = freezed,
    Object? tvPort = freezed,
    Object? tvName = freezed,
    Object? keywords = freezed,
    Object? gameId = freezed,
  }) {
    return _then(_ServerInfo(
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      map: map == freezed
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as String,
      folder: folder == freezed
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String,
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: maxPlayers == freezed
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      bots: bots == freezed
          ? _value.bots
          : bots // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ServerType,
      os: os == freezed
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as ServerOS,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as ServerVisibility,
      vac: vac == freezed
          ? _value.vac
          : vac // ignore: cast_nullable_to_non_nullable
              as ServerVAC,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      steamId: steamId == freezed
          ? _value.steamId
          : steamId // ignore: cast_nullable_to_non_nullable
              as int?,
      tvPort: tvPort == freezed
          ? _value.tvPort
          : tvPort // ignore: cast_nullable_to_non_nullable
              as int?,
      tvName: tvName == freezed
          ? _value.tvName
          : tvName // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: keywords == freezed
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      gameId: gameId == freezed
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ServerInfo implements _ServerInfo {
  _$_ServerInfo(
      {required this.protocol,
      required this.name,
      required this.map,
      required this.folder,
      required this.game,
      required this.id,
      required this.players,
      required this.maxPlayers,
      required this.bots,
      required this.type,
      required this.os,
      required this.visibility,
      required this.vac,
      required this.version,
      this.port,
      this.steamId,
      this.tvPort,
      this.tvName,
      this.keywords,
      this.gameId});

  @override

  /// Protocol version used by the server.
  final int protocol;
  @override

  /// Name of the server.
  final String name;
  @override

  /// Map the server has currently loaded.
  final String map;
  @override

  /// Name of the folder containing the game files.
  final String folder;
  @override

  /// Full name of the game.
  final String game;
  @override

  /// Steam Application ID of game.
  final int id;
  @override

  /// Number of players on the server.
  final int players;
  @override

  /// Maximum number of players the server reports it can hold.
  final int maxPlayers;
  @override

  /// Number of bots on the server.
  final int bots;
  @override

  /// Server type.
  final ServerType type;
  @override

  /// Server operating system.
  final ServerOS os;
  @override

  /// Server visibility. Indicates if the server is password protected.
  final ServerVisibility visibility;
  @override

  /// Server VAC status.
  final ServerVAC vac;
  @override /* TODO: Add TheShip flags */
  /// Version of the game installed on the server.
  final String version;
  @override

  /// Server's port number.
  final int? port;
  @override

  /// Server's SteamID.
  final int? steamId;
  @override

  /// Spectator port number for SourceTV.
  final int? tvPort;
  @override

  /// Name of the spectator server for SourceTV.
  final String? tvName;
  @override

  /// Tags that describe the game according to the server (for future use.)
  final String? keywords;
  @override

  /// The server's 64-bit GameID.
  final int? gameId;

  @override
  String toString() {
    return 'ServerInfo(protocol: $protocol, name: $name, map: $map, folder: $folder, game: $game, id: $id, players: $players, maxPlayers: $maxPlayers, bots: $bots, type: $type, os: $os, visibility: $visibility, vac: $vac, version: $version, port: $port, steamId: $steamId, tvPort: $tvPort, tvName: $tvName, keywords: $keywords, gameId: $gameId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServerInfo &&
            (identical(other.protocol, protocol) ||
                const DeepCollectionEquality()
                    .equals(other.protocol, protocol)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.map, map) ||
                const DeepCollectionEquality().equals(other.map, map)) &&
            (identical(other.folder, folder) ||
                const DeepCollectionEquality().equals(other.folder, folder)) &&
            (identical(other.game, game) ||
                const DeepCollectionEquality().equals(other.game, game)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.players, players) ||
                const DeepCollectionEquality()
                    .equals(other.players, players)) &&
            (identical(other.maxPlayers, maxPlayers) ||
                const DeepCollectionEquality()
                    .equals(other.maxPlayers, maxPlayers)) &&
            (identical(other.bots, bots) ||
                const DeepCollectionEquality().equals(other.bots, bots)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.os, os) ||
                const DeepCollectionEquality().equals(other.os, os)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.vac, vac) ||
                const DeepCollectionEquality().equals(other.vac, vac)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.port, port) ||
                const DeepCollectionEquality().equals(other.port, port)) &&
            (identical(other.steamId, steamId) ||
                const DeepCollectionEquality()
                    .equals(other.steamId, steamId)) &&
            (identical(other.tvPort, tvPort) ||
                const DeepCollectionEquality().equals(other.tvPort, tvPort)) &&
            (identical(other.tvName, tvName) ||
                const DeepCollectionEquality().equals(other.tvName, tvName)) &&
            (identical(other.keywords, keywords) ||
                const DeepCollectionEquality()
                    .equals(other.keywords, keywords)) &&
            (identical(other.gameId, gameId) ||
                const DeepCollectionEquality().equals(other.gameId, gameId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(protocol) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(map) ^
      const DeepCollectionEquality().hash(folder) ^
      const DeepCollectionEquality().hash(game) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(players) ^
      const DeepCollectionEquality().hash(maxPlayers) ^
      const DeepCollectionEquality().hash(bots) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(os) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(vac) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(port) ^
      const DeepCollectionEquality().hash(steamId) ^
      const DeepCollectionEquality().hash(tvPort) ^
      const DeepCollectionEquality().hash(tvName) ^
      const DeepCollectionEquality().hash(keywords) ^
      const DeepCollectionEquality().hash(gameId);

  @JsonKey(ignore: true)
  @override
  _$ServerInfoCopyWith<_ServerInfo> get copyWith =>
      __$ServerInfoCopyWithImpl<_ServerInfo>(this, _$identity);
}

abstract class _ServerInfo implements ServerInfo {
  factory _ServerInfo(
      {required int protocol,
      required String name,
      required String map,
      required String folder,
      required String game,
      required int id,
      required int players,
      required int maxPlayers,
      required int bots,
      required ServerType type,
      required ServerOS os,
      required ServerVisibility visibility,
      required ServerVAC vac,
      required String version,
      int? port,
      int? steamId,
      int? tvPort,
      String? tvName,
      String? keywords,
      int? gameId}) = _$_ServerInfo;

  @override

  /// Protocol version used by the server.
  int get protocol => throw _privateConstructorUsedError;
  @override

  /// Name of the server.
  String get name => throw _privateConstructorUsedError;
  @override

  /// Map the server has currently loaded.
  String get map => throw _privateConstructorUsedError;
  @override

  /// Name of the folder containing the game files.
  String get folder => throw _privateConstructorUsedError;
  @override

  /// Full name of the game.
  String get game => throw _privateConstructorUsedError;
  @override

  /// Steam Application ID of game.
  int get id => throw _privateConstructorUsedError;
  @override

  /// Number of players on the server.
  int get players => throw _privateConstructorUsedError;
  @override

  /// Maximum number of players the server reports it can hold.
  int get maxPlayers => throw _privateConstructorUsedError;
  @override

  /// Number of bots on the server.
  int get bots => throw _privateConstructorUsedError;
  @override

  /// Server type.
  ServerType get type => throw _privateConstructorUsedError;
  @override

  /// Server operating system.
  ServerOS get os => throw _privateConstructorUsedError;
  @override

  /// Server visibility. Indicates if the server is password protected.
  ServerVisibility get visibility => throw _privateConstructorUsedError;
  @override

  /// Server VAC status.
  ServerVAC get vac => throw _privateConstructorUsedError;
  @override /* TODO: Add TheShip flags */
  /// Version of the game installed on the server.
  String get version => throw _privateConstructorUsedError;
  @override

  /// Server's port number.
  int? get port => throw _privateConstructorUsedError;
  @override

  /// Server's SteamID.
  int? get steamId => throw _privateConstructorUsedError;
  @override

  /// Spectator port number for SourceTV.
  int? get tvPort => throw _privateConstructorUsedError;
  @override

  /// Name of the spectator server for SourceTV.
  String? get tvName => throw _privateConstructorUsedError;
  @override

  /// Tags that describe the game according to the server (for future use.)
  String? get keywords => throw _privateConstructorUsedError;
  @override

  /// The server's 64-bit GameID.
  int? get gameId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServerInfoCopyWith<_ServerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
