// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'query_player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$QueryPlayerTearOff {
  const _$QueryPlayerTearOff();

// ignore: unused_element
  _QueryPlayer call({int index, String name, int score, double duration}) {
    return _QueryPlayer(
      index: index,
      name: name,
      score: score,
      duration: duration,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $QueryPlayer = _$QueryPlayerTearOff();

/// @nodoc
mixin _$QueryPlayer {
  /// Index of player.
  int get index;

  /// Name of the player.
  String get name;

  /// Player's score (usually "frags" or "kills".)
  int get score;

  /// Time (in seconds) player has been connected to the server.
  double get duration;

  $QueryPlayerCopyWith<QueryPlayer> get copyWith;
}

/// @nodoc
abstract class $QueryPlayerCopyWith<$Res> {
  factory $QueryPlayerCopyWith(
          QueryPlayer value, $Res Function(QueryPlayer) then) =
      _$QueryPlayerCopyWithImpl<$Res>;
  $Res call({int index, String name, int score, double duration});
}

/// @nodoc
class _$QueryPlayerCopyWithImpl<$Res> implements $QueryPlayerCopyWith<$Res> {
  _$QueryPlayerCopyWithImpl(this._value, this._then);

  final QueryPlayer _value;
  // ignore: unused_field
  final $Res Function(QueryPlayer) _then;

  @override
  $Res call({
    Object index = freezed,
    Object name = freezed,
    Object score = freezed,
    Object duration = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed ? _value.index : index as int,
      name: name == freezed ? _value.name : name as String,
      score: score == freezed ? _value.score : score as int,
      duration: duration == freezed ? _value.duration : duration as double,
    ));
  }
}

/// @nodoc
abstract class _$QueryPlayerCopyWith<$Res>
    implements $QueryPlayerCopyWith<$Res> {
  factory _$QueryPlayerCopyWith(
          _QueryPlayer value, $Res Function(_QueryPlayer) then) =
      __$QueryPlayerCopyWithImpl<$Res>;
  @override
  $Res call({int index, String name, int score, double duration});
}

/// @nodoc
class __$QueryPlayerCopyWithImpl<$Res> extends _$QueryPlayerCopyWithImpl<$Res>
    implements _$QueryPlayerCopyWith<$Res> {
  __$QueryPlayerCopyWithImpl(
      _QueryPlayer _value, $Res Function(_QueryPlayer) _then)
      : super(_value, (v) => _then(v as _QueryPlayer));

  @override
  _QueryPlayer get _value => super._value as _QueryPlayer;

  @override
  $Res call({
    Object index = freezed,
    Object name = freezed,
    Object score = freezed,
    Object duration = freezed,
  }) {
    return _then(_QueryPlayer(
      index: index == freezed ? _value.index : index as int,
      name: name == freezed ? _value.name : name as String,
      score: score == freezed ? _value.score : score as int,
      duration: duration == freezed ? _value.duration : duration as double,
    ));
  }
}

/// @nodoc
class _$_QueryPlayer implements _QueryPlayer {
  _$_QueryPlayer({this.index, this.name, this.score, this.duration});

  @override

  /// Index of player.
  final int index;
  @override

  /// Name of the player.
  final String name;
  @override

  /// Player's score (usually "frags" or "kills".)
  final int score;
  @override

  /// Time (in seconds) player has been connected to the server.
  final double duration;

  @override
  String toString() {
    return 'QueryPlayer(index: $index, name: $name, score: $score, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QueryPlayer &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(duration);

  @override
  _$QueryPlayerCopyWith<_QueryPlayer> get copyWith =>
      __$QueryPlayerCopyWithImpl<_QueryPlayer>(this, _$identity);
}

abstract class _QueryPlayer implements QueryPlayer {
  factory _QueryPlayer({int index, String name, int score, double duration}) =
      _$_QueryPlayer;

  @override

  /// Index of player.
  int get index;
  @override

  /// Name of the player.
  String get name;
  @override

  /// Player's score (usually "frags" or "kills".)
  int get score;
  @override

  /// Time (in seconds) player has been connected to the server.
  double get duration;
  @override
  _$QueryPlayerCopyWith<_QueryPlayer> get copyWith;
}
