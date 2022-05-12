// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'server_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServerInfo {
  /// MOTD.
  String get motd => throw _privateConstructorUsedError;

  /// Gametype.
  String get gametype => throw _privateConstructorUsedError;

  /// Map.
  String get map => throw _privateConstructorUsedError;

  /// Number of players on the server.
  int get players => throw _privateConstructorUsedError;

  /// Maximum number of players the server reports it can hold.
  int get maxPlayers => throw _privateConstructorUsedError;

  /// Server's port.
  int get port => throw _privateConstructorUsedError;

  /// Server's name.
  String get ip => throw _privateConstructorUsedError;

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
      {String motd,
      String gametype,
      String map,
      int players,
      int maxPlayers,
      int port,
      String ip});
}

/// @nodoc
class _$ServerInfoCopyWithImpl<$Res> implements $ServerInfoCopyWith<$Res> {
  _$ServerInfoCopyWithImpl(this._value, this._then);

  final ServerInfo _value;
  // ignore: unused_field
  final $Res Function(ServerInfo) _then;

  @override
  $Res call({
    Object? motd = freezed,
    Object? gametype = freezed,
    Object? map = freezed,
    Object? players = freezed,
    Object? maxPlayers = freezed,
    Object? port = freezed,
    Object? ip = freezed,
  }) {
    return _then(_value.copyWith(
      motd: motd == freezed
          ? _value.motd
          : motd // ignore: cast_nullable_to_non_nullable
              as String,
      gametype: gametype == freezed
          ? _value.gametype
          : gametype // ignore: cast_nullable_to_non_nullable
              as String,
      map: map == freezed
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: maxPlayers == freezed
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      ip: ip == freezed
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ServerInfoCopyWith<$Res>
    implements $ServerInfoCopyWith<$Res> {
  factory _$$_ServerInfoCopyWith(
          _$_ServerInfo value, $Res Function(_$_ServerInfo) then) =
      __$$_ServerInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String motd,
      String gametype,
      String map,
      int players,
      int maxPlayers,
      int port,
      String ip});
}

/// @nodoc
class __$$_ServerInfoCopyWithImpl<$Res> extends _$ServerInfoCopyWithImpl<$Res>
    implements _$$_ServerInfoCopyWith<$Res> {
  __$$_ServerInfoCopyWithImpl(
      _$_ServerInfo _value, $Res Function(_$_ServerInfo) _then)
      : super(_value, (v) => _then(v as _$_ServerInfo));

  @override
  _$_ServerInfo get _value => super._value as _$_ServerInfo;

  @override
  $Res call({
    Object? motd = freezed,
    Object? gametype = freezed,
    Object? map = freezed,
    Object? players = freezed,
    Object? maxPlayers = freezed,
    Object? port = freezed,
    Object? ip = freezed,
  }) {
    return _then(_$_ServerInfo(
      motd: motd == freezed
          ? _value.motd
          : motd // ignore: cast_nullable_to_non_nullable
              as String,
      gametype: gametype == freezed
          ? _value.gametype
          : gametype // ignore: cast_nullable_to_non_nullable
              as String,
      map: map == freezed
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: maxPlayers == freezed
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      ip: ip == freezed
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ServerInfo implements _ServerInfo {
  _$_ServerInfo(
      {required this.motd,
      required this.gametype,
      required this.map,
      required this.players,
      required this.maxPlayers,
      required this.port,
      required this.ip});

  /// MOTD.
  @override
  final String motd;

  /// Gametype.
  @override
  final String gametype;

  /// Map.
  @override
  final String map;

  /// Number of players on the server.
  @override
  final int players;

  /// Maximum number of players the server reports it can hold.
  @override
  final int maxPlayers;

  /// Server's port.
  @override
  final int port;

  /// Server's name.
  @override
  final String ip;

  @override
  String toString() {
    return 'ServerInfo(motd: $motd, gametype: $gametype, map: $map, players: $players, maxPlayers: $maxPlayers, port: $port, ip: $ip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerInfo &&
            const DeepCollectionEquality().equals(other.motd, motd) &&
            const DeepCollectionEquality().equals(other.gametype, gametype) &&
            const DeepCollectionEquality().equals(other.map, map) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality()
                .equals(other.maxPlayers, maxPlayers) &&
            const DeepCollectionEquality().equals(other.port, port) &&
            const DeepCollectionEquality().equals(other.ip, ip));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(motd),
      const DeepCollectionEquality().hash(gametype),
      const DeepCollectionEquality().hash(map),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(maxPlayers),
      const DeepCollectionEquality().hash(port),
      const DeepCollectionEquality().hash(ip));

  @JsonKey(ignore: true)
  @override
  _$$_ServerInfoCopyWith<_$_ServerInfo> get copyWith =>
      __$$_ServerInfoCopyWithImpl<_$_ServerInfo>(this, _$identity);
}

abstract class _ServerInfo implements ServerInfo {
  factory _ServerInfo(
      {required final String motd,
      required final String gametype,
      required final String map,
      required final int players,
      required final int maxPlayers,
      required final int port,
      required final String ip}) = _$_ServerInfo;

  @override

  /// MOTD.
  String get motd => throw _privateConstructorUsedError;
  @override

  /// Gametype.
  String get gametype => throw _privateConstructorUsedError;
  @override

  /// Map.
  String get map => throw _privateConstructorUsedError;
  @override

  /// Number of players on the server.
  int get players => throw _privateConstructorUsedError;
  @override

  /// Maximum number of players the server reports it can hold.
  int get maxPlayers => throw _privateConstructorUsedError;
  @override

  /// Server's port.
  int get port => throw _privateConstructorUsedError;
  @override

  /// Server's name.
  String get ip => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ServerInfoCopyWith<_$_ServerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
