// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'query_player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QueryPlayer {
  /// Index of player.
  int get index => throw _privateConstructorUsedError;

  /// Name of the player.
  String get name => throw _privateConstructorUsedError;

  /// Player's score (usually "frags" or "kills".)
  int get score => throw _privateConstructorUsedError;

  /// Time (in seconds) player has been connected to the server.
  double get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueryPlayerCopyWith<QueryPlayer> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? index = freezed,
    Object? name = freezed,
    Object? score = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_QueryPlayerCopyWith<$Res>
    implements $QueryPlayerCopyWith<$Res> {
  factory _$$_QueryPlayerCopyWith(
          _$_QueryPlayer value, $Res Function(_$_QueryPlayer) then) =
      __$$_QueryPlayerCopyWithImpl<$Res>;
  @override
  $Res call({int index, String name, int score, double duration});
}

/// @nodoc
class __$$_QueryPlayerCopyWithImpl<$Res> extends _$QueryPlayerCopyWithImpl<$Res>
    implements _$$_QueryPlayerCopyWith<$Res> {
  __$$_QueryPlayerCopyWithImpl(
      _$_QueryPlayer _value, $Res Function(_$_QueryPlayer) _then)
      : super(_value, (v) => _then(v as _$_QueryPlayer));

  @override
  _$_QueryPlayer get _value => super._value as _$_QueryPlayer;

  @override
  $Res call({
    Object? index = freezed,
    Object? name = freezed,
    Object? score = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_QueryPlayer(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_QueryPlayer implements _QueryPlayer {
  _$_QueryPlayer(
      {required this.index,
      required this.name,
      required this.score,
      required this.duration});

  /// Index of player.
  @override
  final int index;

  /// Name of the player.
  @override
  final String name;

  /// Player's score (usually "frags" or "kills".)
  @override
  final int score;

  /// Time (in seconds) player has been connected to the server.
  @override
  final double duration;

  @override
  String toString() {
    return 'QueryPlayer(index: $index, name: $name, score: $score, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryPlayer &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_QueryPlayerCopyWith<_$_QueryPlayer> get copyWith =>
      __$$_QueryPlayerCopyWithImpl<_$_QueryPlayer>(this, _$identity);
}

abstract class _QueryPlayer implements QueryPlayer {
  factory _QueryPlayer(
      {required final int index,
      required final String name,
      required final int score,
      required final double duration}) = _$_QueryPlayer;

  @override

  /// Index of player.
  int get index => throw _privateConstructorUsedError;
  @override

  /// Name of the player.
  String get name => throw _privateConstructorUsedError;
  @override

  /// Player's score (usually "frags" or "kills".)
  int get score => throw _privateConstructorUsedError;
  @override

  /// Time (in seconds) player has been connected to the server.
  double get duration => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_QueryPlayerCopyWith<_$_QueryPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}
