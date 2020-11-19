// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'server_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ServerInfoTearOff {
  const _$ServerInfoTearOff();

// ignore: unused_element
  _ServerInfo call(
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
      @nullable int port,
      @nullable int steamId,
      @nullable int tvPort,
      @nullable String tvName,
      @nullable String keywords,
      @nullable int gameId}) {
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
// ignore: unused_element
const $ServerInfo = _$ServerInfoTearOff();

/// @nodoc
mixin _$ServerInfo {
  /// Protocol version used by the server.
  int get protocol;

  /// Name of the server.
  String get name;

  /// Map the server has currently loaded.
  String get map;

  /// Name of the folder containing the game files.
  String get folder;

  /// Full name of the game.
  String get game;

  /// Steam Application ID of game.
  int get id;

  /// Number of players on the server.
  int get players;

  /// Maximum number of players the server reports it can hold.
  int get maxPlayers;

  /// Number of bots on the server.
  int get bots;

  /// Server type.
  ServerType get type;

  /// Server operating system.
  ServerOS get os;

  /// Server visibility. Indicates if the server is password protected.
  ServerVisibility get visibility;

  /// Server VAC status.
  ServerVAC get vac; /* TODO: Add TheShip flags */
  /// Version of the game installed on the server.
  String get version;

  /// Server's port number.
  @nullable
  int get port;

  /// Server's SteamID.
  @nullable
  int get steamId;

  /// Spectator port number for SourceTV.
  @nullable
  int get tvPort;

  /// Name of the spectator server for SourceTV.
  @nullable
  String get tvName;

  /// Tags that describe the game according to the server (for future use.)
  @nullable
  String get keywords;

  /// The server's 64-bit GameID.
  @nullable
  int get gameId;

  $ServerInfoCopyWith<ServerInfo> get copyWith;
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
      @nullable int port,
      @nullable int steamId,
      @nullable int tvPort,
      @nullable String tvName,
      @nullable String keywords,
      @nullable int gameId});
}

/// @nodoc
class _$ServerInfoCopyWithImpl<$Res> implements $ServerInfoCopyWith<$Res> {
  _$ServerInfoCopyWithImpl(this._value, this._then);

  final ServerInfo _value;
  // ignore: unused_field
  final $Res Function(ServerInfo) _then;

  @override
  $Res call({
    Object protocol = freezed,
    Object name = freezed,
    Object map = freezed,
    Object folder = freezed,
    Object game = freezed,
    Object id = freezed,
    Object players = freezed,
    Object maxPlayers = freezed,
    Object bots = freezed,
    Object type = freezed,
    Object os = freezed,
    Object visibility = freezed,
    Object vac = freezed,
    Object version = freezed,
    Object port = freezed,
    Object steamId = freezed,
    Object tvPort = freezed,
    Object tvName = freezed,
    Object keywords = freezed,
    Object gameId = freezed,
  }) {
    return _then(_value.copyWith(
      protocol: protocol == freezed ? _value.protocol : protocol as int,
      name: name == freezed ? _value.name : name as String,
      map: map == freezed ? _value.map : map as String,
      folder: folder == freezed ? _value.folder : folder as String,
      game: game == freezed ? _value.game : game as String,
      id: id == freezed ? _value.id : id as int,
      players: players == freezed ? _value.players : players as int,
      maxPlayers: maxPlayers == freezed ? _value.maxPlayers : maxPlayers as int,
      bots: bots == freezed ? _value.bots : bots as int,
      type: type == freezed ? _value.type : type as ServerType,
      os: os == freezed ? _value.os : os as ServerOS,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility as ServerVisibility,
      vac: vac == freezed ? _value.vac : vac as ServerVAC,
      version: version == freezed ? _value.version : version as String,
      port: port == freezed ? _value.port : port as int,
      steamId: steamId == freezed ? _value.steamId : steamId as int,
      tvPort: tvPort == freezed ? _value.tvPort : tvPort as int,
      tvName: tvName == freezed ? _value.tvName : tvName as String,
      keywords: keywords == freezed ? _value.keywords : keywords as String,
      gameId: gameId == freezed ? _value.gameId : gameId as int,
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
      @nullable int port,
      @nullable int steamId,
      @nullable int tvPort,
      @nullable String tvName,
      @nullable String keywords,
      @nullable int gameId});
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
    Object protocol = freezed,
    Object name = freezed,
    Object map = freezed,
    Object folder = freezed,
    Object game = freezed,
    Object id = freezed,
    Object players = freezed,
    Object maxPlayers = freezed,
    Object bots = freezed,
    Object type = freezed,
    Object os = freezed,
    Object visibility = freezed,
    Object vac = freezed,
    Object version = freezed,
    Object port = freezed,
    Object steamId = freezed,
    Object tvPort = freezed,
    Object tvName = freezed,
    Object keywords = freezed,
    Object gameId = freezed,
  }) {
    return _then(_ServerInfo(
      protocol: protocol == freezed ? _value.protocol : protocol as int,
      name: name == freezed ? _value.name : name as String,
      map: map == freezed ? _value.map : map as String,
      folder: folder == freezed ? _value.folder : folder as String,
      game: game == freezed ? _value.game : game as String,
      id: id == freezed ? _value.id : id as int,
      players: players == freezed ? _value.players : players as int,
      maxPlayers: maxPlayers == freezed ? _value.maxPlayers : maxPlayers as int,
      bots: bots == freezed ? _value.bots : bots as int,
      type: type == freezed ? _value.type : type as ServerType,
      os: os == freezed ? _value.os : os as ServerOS,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility as ServerVisibility,
      vac: vac == freezed ? _value.vac : vac as ServerVAC,
      version: version == freezed ? _value.version : version as String,
      port: port == freezed ? _value.port : port as int,
      steamId: steamId == freezed ? _value.steamId : steamId as int,
      tvPort: tvPort == freezed ? _value.tvPort : tvPort as int,
      tvName: tvName == freezed ? _value.tvName : tvName as String,
      keywords: keywords == freezed ? _value.keywords : keywords as String,
      gameId: gameId == freezed ? _value.gameId : gameId as int,
    ));
  }
}

/// @nodoc
class _$_ServerInfo implements _ServerInfo {
  _$_ServerInfo(
      {this.protocol,
      this.name,
      this.map,
      this.folder,
      this.game,
      this.id,
      this.players,
      this.maxPlayers,
      this.bots,
      this.type,
      this.os,
      this.visibility,
      this.vac,
      this.version,
      @nullable this.port,
      @nullable this.steamId,
      @nullable this.tvPort,
      @nullable this.tvName,
      @nullable this.keywords,
      @nullable this.gameId});

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
  @nullable
  final int port;
  @override

  /// Server's SteamID.
  @nullable
  final int steamId;
  @override

  /// Spectator port number for SourceTV.
  @nullable
  final int tvPort;
  @override

  /// Name of the spectator server for SourceTV.
  @nullable
  final String tvName;
  @override

  /// Tags that describe the game according to the server (for future use.)
  @nullable
  final String keywords;
  @override

  /// The server's 64-bit GameID.
  @nullable
  final int gameId;

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

  @override
  _$ServerInfoCopyWith<_ServerInfo> get copyWith =>
      __$ServerInfoCopyWithImpl<_ServerInfo>(this, _$identity);
}

abstract class _ServerInfo implements ServerInfo {
  factory _ServerInfo(
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
      @nullable int port,
      @nullable int steamId,
      @nullable int tvPort,
      @nullable String tvName,
      @nullable String keywords,
      @nullable int gameId}) = _$_ServerInfo;

  @override

  /// Protocol version used by the server.
  int get protocol;
  @override

  /// Name of the server.
  String get name;
  @override

  /// Map the server has currently loaded.
  String get map;
  @override

  /// Name of the folder containing the game files.
  String get folder;
  @override

  /// Full name of the game.
  String get game;
  @override

  /// Steam Application ID of game.
  int get id;
  @override

  /// Number of players on the server.
  int get players;
  @override

  /// Maximum number of players the server reports it can hold.
  int get maxPlayers;
  @override

  /// Number of bots on the server.
  int get bots;
  @override

  /// Server type.
  ServerType get type;
  @override

  /// Server operating system.
  ServerOS get os;
  @override

  /// Server visibility. Indicates if the server is password protected.
  ServerVisibility get visibility;
  @override

  /// Server VAC status.
  ServerVAC get vac;
  @override /* TODO: Add TheShip flags */
  /// Version of the game installed on the server.
  String get version;
  @override

  /// Server's port number.
  @nullable
  int get port;
  @override

  /// Server's SteamID.
  @nullable
  int get steamId;
  @override

  /// Spectator port number for SourceTV.
  @nullable
  int get tvPort;
  @override

  /// Name of the spectator server for SourceTV.
  @nullable
  String get tvName;
  @override

  /// Tags that describe the game according to the server (for future use.)
  @nullable
  String get keywords;
  @override

  /// The server's 64-bit GameID.
  @nullable
  int get gameId;
  @override
  _$ServerInfoCopyWith<_ServerInfo> get copyWith;
}
