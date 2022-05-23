// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'server_ping_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServerPingInfo _$ServerPingInfoFromJson(Map<String, dynamic> json) {
  return _ServerPingInfo.fromJson(json);
}

/// @nodoc
mixin _$ServerPingInfo {
  /// Server and protocol version.
  Version get version => throw _privateConstructorUsedError;

  /// Total and connected players.
  Players get players => throw _privateConstructorUsedError;

  /// MOTD description.
// ignore: invalid_annotation_target
  @JsonKey(fromJson: _descriptionToJson)
  Description get description => throw _privateConstructorUsedError;

  /// Favicon data uri.
  String? get favicon => throw _privateConstructorUsedError;

  /// Server's mods.
  Modinfo? get modinfo => throw _privateConstructorUsedError;

  /// Server's ping.
  int? get ping => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerPingInfoCopyWith<ServerPingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerPingInfoCopyWith<$Res> {
  factory $ServerPingInfoCopyWith(
          ServerPingInfo value, $Res Function(ServerPingInfo) then) =
      _$ServerPingInfoCopyWithImpl<$Res>;
  $Res call(
      {Version version,
      Players players,
      @JsonKey(fromJson: _descriptionToJson) Description description,
      String? favicon,
      Modinfo? modinfo,
      int? ping});

  $VersionCopyWith<$Res> get version;
  $PlayersCopyWith<$Res> get players;
  $DescriptionCopyWith<$Res> get description;
  $ModinfoCopyWith<$Res>? get modinfo;
}

/// @nodoc
class _$ServerPingInfoCopyWithImpl<$Res>
    implements $ServerPingInfoCopyWith<$Res> {
  _$ServerPingInfoCopyWithImpl(this._value, this._then);

  final ServerPingInfo _value;
  // ignore: unused_field
  final $Res Function(ServerPingInfo) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? players = freezed,
    Object? description = freezed,
    Object? favicon = freezed,
    Object? modinfo = freezed,
    Object? ping = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Players,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Description,
      favicon: favicon == freezed
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String?,
      modinfo: modinfo == freezed
          ? _value.modinfo
          : modinfo // ignore: cast_nullable_to_non_nullable
              as Modinfo?,
      ping: ping == freezed
          ? _value.ping
          : ping // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $VersionCopyWith<$Res> get version {
    return $VersionCopyWith<$Res>(_value.version, (value) {
      return _then(_value.copyWith(version: value));
    });
  }

  @override
  $PlayersCopyWith<$Res> get players {
    return $PlayersCopyWith<$Res>(_value.players, (value) {
      return _then(_value.copyWith(players: value));
    });
  }

  @override
  $DescriptionCopyWith<$Res> get description {
    return $DescriptionCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value));
    });
  }

  @override
  $ModinfoCopyWith<$Res>? get modinfo {
    if (_value.modinfo == null) {
      return null;
    }

    return $ModinfoCopyWith<$Res>(_value.modinfo!, (value) {
      return _then(_value.copyWith(modinfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_ServerPingInfoCopyWith<$Res>
    implements $ServerPingInfoCopyWith<$Res> {
  factory _$$_ServerPingInfoCopyWith(
          _$_ServerPingInfo value, $Res Function(_$_ServerPingInfo) then) =
      __$$_ServerPingInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {Version version,
      Players players,
      @JsonKey(fromJson: _descriptionToJson) Description description,
      String? favicon,
      Modinfo? modinfo,
      int? ping});

  @override
  $VersionCopyWith<$Res> get version;
  @override
  $PlayersCopyWith<$Res> get players;
  @override
  $DescriptionCopyWith<$Res> get description;
  @override
  $ModinfoCopyWith<$Res>? get modinfo;
}

/// @nodoc
class __$$_ServerPingInfoCopyWithImpl<$Res>
    extends _$ServerPingInfoCopyWithImpl<$Res>
    implements _$$_ServerPingInfoCopyWith<$Res> {
  __$$_ServerPingInfoCopyWithImpl(
      _$_ServerPingInfo _value, $Res Function(_$_ServerPingInfo) _then)
      : super(_value, (v) => _then(v as _$_ServerPingInfo));

  @override
  _$_ServerPingInfo get _value => super._value as _$_ServerPingInfo;

  @override
  $Res call({
    Object? version = freezed,
    Object? players = freezed,
    Object? description = freezed,
    Object? favicon = freezed,
    Object? modinfo = freezed,
    Object? ping = freezed,
  }) {
    return _then(_$_ServerPingInfo(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Players,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Description,
      favicon: favicon == freezed
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String?,
      modinfo: modinfo == freezed
          ? _value.modinfo
          : modinfo // ignore: cast_nullable_to_non_nullable
              as Modinfo?,
      ping: ping == freezed
          ? _value.ping
          : ping // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServerPingInfo implements _ServerPingInfo {
  const _$_ServerPingInfo(
      {required this.version,
      required this.players,
      @JsonKey(fromJson: _descriptionToJson) required this.description,
      this.favicon,
      this.modinfo,
      this.ping});

  factory _$_ServerPingInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ServerPingInfoFromJson(json);

  /// Server and protocol version.
  @override
  final Version version;

  /// Total and connected players.
  @override
  final Players players;

  /// MOTD description.
// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: _descriptionToJson)
  final Description description;

  /// Favicon data uri.
  @override
  final String? favicon;

  /// Server's mods.
  @override
  final Modinfo? modinfo;

  /// Server's ping.
  @override
  final int? ping;

  @override
  String toString() {
    return 'ServerPingInfo(version: $version, players: $players, description: $description, favicon: $favicon, modinfo: $modinfo, ping: $ping)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerPingInfo &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.favicon, favicon) &&
            const DeepCollectionEquality().equals(other.modinfo, modinfo) &&
            const DeepCollectionEquality().equals(other.ping, ping));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(favicon),
      const DeepCollectionEquality().hash(modinfo),
      const DeepCollectionEquality().hash(ping));

  @JsonKey(ignore: true)
  @override
  _$$_ServerPingInfoCopyWith<_$_ServerPingInfo> get copyWith =>
      __$$_ServerPingInfoCopyWithImpl<_$_ServerPingInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServerPingInfoToJson(this);
  }
}

abstract class _ServerPingInfo implements ServerPingInfo {
  const factory _ServerPingInfo(
      {required final Version version,
      required final Players players,
      @JsonKey(fromJson: _descriptionToJson)
          required final Description description,
      final String? favicon,
      final Modinfo? modinfo,
      final int? ping}) = _$_ServerPingInfo;

  factory _ServerPingInfo.fromJson(Map<String, dynamic> json) =
      _$_ServerPingInfo.fromJson;

  @override

  /// Server and protocol version.
  Version get version => throw _privateConstructorUsedError;
  @override

  /// Total and connected players.
  Players get players => throw _privateConstructorUsedError;
  @override

  /// MOTD description.
// ignore: invalid_annotation_target
  @JsonKey(fromJson: _descriptionToJson)
  Description get description => throw _privateConstructorUsedError;
  @override

  /// Favicon data uri.
  String? get favicon => throw _privateConstructorUsedError;
  @override

  /// Server's mods.
  Modinfo? get modinfo => throw _privateConstructorUsedError;
  @override

  /// Server's ping.
  int? get ping => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ServerPingInfoCopyWith<_$_ServerPingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Description _$DescriptionFromJson(Map<String, dynamic> json) {
  return _Description.fromJson(json);
}

/// @nodoc
mixin _$Description {
  /// Extra MOTD text.
  List<Extra>? get extra => throw _privateConstructorUsedError;

  /// Motd text.
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DescriptionCopyWith<Description> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DescriptionCopyWith<$Res> {
  factory $DescriptionCopyWith(
          Description value, $Res Function(Description) then) =
      _$DescriptionCopyWithImpl<$Res>;
  $Res call({List<Extra>? extra, String text});
}

/// @nodoc
class _$DescriptionCopyWithImpl<$Res> implements $DescriptionCopyWith<$Res> {
  _$DescriptionCopyWithImpl(this._value, this._then);

  final Description _value;
  // ignore: unused_field
  final $Res Function(Description) _then;

  @override
  $Res call({
    Object? extra = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      extra: extra == freezed
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<Extra>?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DescriptionCopyWith<$Res>
    implements $DescriptionCopyWith<$Res> {
  factory _$$_DescriptionCopyWith(
          _$_Description value, $Res Function(_$_Description) then) =
      __$$_DescriptionCopyWithImpl<$Res>;
  @override
  $Res call({List<Extra>? extra, String text});
}

/// @nodoc
class __$$_DescriptionCopyWithImpl<$Res> extends _$DescriptionCopyWithImpl<$Res>
    implements _$$_DescriptionCopyWith<$Res> {
  __$$_DescriptionCopyWithImpl(
      _$_Description _value, $Res Function(_$_Description) _then)
      : super(_value, (v) => _then(v as _$_Description));

  @override
  _$_Description get _value => super._value as _$_Description;

  @override
  $Res call({
    Object? extra = freezed,
    Object? text = freezed,
  }) {
    return _then(_$_Description(
      extra: extra == freezed
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<Extra>?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Description implements _Description {
  const _$_Description({final List<Extra>? extra, required this.text})
      : _extra = extra;

  factory _$_Description.fromJson(Map<String, dynamic> json) =>
      _$$_DescriptionFromJson(json);

  /// Extra MOTD text.
  final List<Extra>? _extra;

  /// Extra MOTD text.
  @override
  List<Extra>? get extra {
    final value = _extra;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Motd text.
  @override
  final String text;

  @override
  String toString() {
    return 'Description(extra: $extra, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Description &&
            const DeepCollectionEquality().equals(other._extra, _extra) &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_extra),
      const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$$_DescriptionCopyWith<_$_Description> get copyWith =>
      __$$_DescriptionCopyWithImpl<_$_Description>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DescriptionToJson(this);
  }
}

abstract class _Description implements Description {
  const factory _Description(
      {final List<Extra>? extra, required final String text}) = _$_Description;

  factory _Description.fromJson(Map<String, dynamic> json) =
      _$_Description.fromJson;

  @override

  /// Extra MOTD text.
  List<Extra>? get extra => throw _privateConstructorUsedError;
  @override

  /// Motd text.
  String get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DescriptionCopyWith<_$_Description> get copyWith =>
      throw _privateConstructorUsedError;
}

Extra _$ExtraFromJson(Map<String, dynamic> json) {
  return _Extra.fromJson(json);
}

/// @nodoc
mixin _$Extra {
  /// Text color.
  String? get color => throw _privateConstructorUsedError;

  /// Actual text.
  String get text => throw _privateConstructorUsedError;

  /// Bold text.
  bool? get bold => throw _privateConstructorUsedError;

  /// Strikethrough text.
  bool? get strikethrough => throw _privateConstructorUsedError;

  /// Italic text.
  bool? get italic => throw _privateConstructorUsedError;

  /// Underlined text.
  bool? get underlined => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtraCopyWith<Extra> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraCopyWith<$Res> {
  factory $ExtraCopyWith(Extra value, $Res Function(Extra) then) =
      _$ExtraCopyWithImpl<$Res>;
  $Res call(
      {String? color,
      String text,
      bool? bold,
      bool? strikethrough,
      bool? italic,
      bool? underlined});
}

/// @nodoc
class _$ExtraCopyWithImpl<$Res> implements $ExtraCopyWith<$Res> {
  _$ExtraCopyWithImpl(this._value, this._then);

  final Extra _value;
  // ignore: unused_field
  final $Res Function(Extra) _then;

  @override
  $Res call({
    Object? color = freezed,
    Object? text = freezed,
    Object? bold = freezed,
    Object? strikethrough = freezed,
    Object? italic = freezed,
    Object? underlined = freezed,
  }) {
    return _then(_value.copyWith(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      bold: bold == freezed
          ? _value.bold
          : bold // ignore: cast_nullable_to_non_nullable
              as bool?,
      strikethrough: strikethrough == freezed
          ? _value.strikethrough
          : strikethrough // ignore: cast_nullable_to_non_nullable
              as bool?,
      italic: italic == freezed
          ? _value.italic
          : italic // ignore: cast_nullable_to_non_nullable
              as bool?,
      underlined: underlined == freezed
          ? _value.underlined
          : underlined // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_ExtraCopyWith<$Res> implements $ExtraCopyWith<$Res> {
  factory _$$_ExtraCopyWith(_$_Extra value, $Res Function(_$_Extra) then) =
      __$$_ExtraCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? color,
      String text,
      bool? bold,
      bool? strikethrough,
      bool? italic,
      bool? underlined});
}

/// @nodoc
class __$$_ExtraCopyWithImpl<$Res> extends _$ExtraCopyWithImpl<$Res>
    implements _$$_ExtraCopyWith<$Res> {
  __$$_ExtraCopyWithImpl(_$_Extra _value, $Res Function(_$_Extra) _then)
      : super(_value, (v) => _then(v as _$_Extra));

  @override
  _$_Extra get _value => super._value as _$_Extra;

  @override
  $Res call({
    Object? color = freezed,
    Object? text = freezed,
    Object? bold = freezed,
    Object? strikethrough = freezed,
    Object? italic = freezed,
    Object? underlined = freezed,
  }) {
    return _then(_$_Extra(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      bold: bold == freezed
          ? _value.bold
          : bold // ignore: cast_nullable_to_non_nullable
              as bool?,
      strikethrough: strikethrough == freezed
          ? _value.strikethrough
          : strikethrough // ignore: cast_nullable_to_non_nullable
              as bool?,
      italic: italic == freezed
          ? _value.italic
          : italic // ignore: cast_nullable_to_non_nullable
              as bool?,
      underlined: underlined == freezed
          ? _value.underlined
          : underlined // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Extra implements _Extra {
  const _$_Extra(
      {this.color,
      required this.text,
      this.bold,
      this.strikethrough,
      this.italic,
      this.underlined});

  factory _$_Extra.fromJson(Map<String, dynamic> json) =>
      _$$_ExtraFromJson(json);

  /// Text color.
  @override
  final String? color;

  /// Actual text.
  @override
  final String text;

  /// Bold text.
  @override
  final bool? bold;

  /// Strikethrough text.
  @override
  final bool? strikethrough;

  /// Italic text.
  @override
  final bool? italic;

  /// Underlined text.
  @override
  final bool? underlined;

  @override
  String toString() {
    return 'Extra(color: $color, text: $text, bold: $bold, strikethrough: $strikethrough, italic: $italic, underlined: $underlined)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Extra &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.bold, bold) &&
            const DeepCollectionEquality()
                .equals(other.strikethrough, strikethrough) &&
            const DeepCollectionEquality().equals(other.italic, italic) &&
            const DeepCollectionEquality()
                .equals(other.underlined, underlined));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(bold),
      const DeepCollectionEquality().hash(strikethrough),
      const DeepCollectionEquality().hash(italic),
      const DeepCollectionEquality().hash(underlined));

  @JsonKey(ignore: true)
  @override
  _$$_ExtraCopyWith<_$_Extra> get copyWith =>
      __$$_ExtraCopyWithImpl<_$_Extra>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExtraToJson(this);
  }
}

abstract class _Extra implements Extra {
  const factory _Extra(
      {final String? color,
      required final String text,
      final bool? bold,
      final bool? strikethrough,
      final bool? italic,
      final bool? underlined}) = _$_Extra;

  factory _Extra.fromJson(Map<String, dynamic> json) = _$_Extra.fromJson;

  @override

  /// Text color.
  String? get color => throw _privateConstructorUsedError;
  @override

  /// Actual text.
  String get text => throw _privateConstructorUsedError;
  @override

  /// Bold text.
  bool? get bold => throw _privateConstructorUsedError;
  @override

  /// Strikethrough text.
  bool? get strikethrough => throw _privateConstructorUsedError;
  @override

  /// Italic text.
  bool? get italic => throw _privateConstructorUsedError;
  @override

  /// Underlined text.
  bool? get underlined => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ExtraCopyWith<_$_Extra> get copyWith =>
      throw _privateConstructorUsedError;
}

Modinfo _$ModinfoFromJson(Map<String, dynamic> json) {
  return _Modinfo.fromJson(json);
}

/// @nodoc
mixin _$Modinfo {
  /// Mods type.
  String get type => throw _privateConstructorUsedError;

  /// Mods list.
  List<Mod> get modList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModinfoCopyWith<Modinfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModinfoCopyWith<$Res> {
  factory $ModinfoCopyWith(Modinfo value, $Res Function(Modinfo) then) =
      _$ModinfoCopyWithImpl<$Res>;
  $Res call({String type, List<Mod> modList});
}

/// @nodoc
class _$ModinfoCopyWithImpl<$Res> implements $ModinfoCopyWith<$Res> {
  _$ModinfoCopyWithImpl(this._value, this._then);

  final Modinfo _value;
  // ignore: unused_field
  final $Res Function(Modinfo) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? modList = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      modList: modList == freezed
          ? _value.modList
          : modList // ignore: cast_nullable_to_non_nullable
              as List<Mod>,
    ));
  }
}

/// @nodoc
abstract class _$$_ModinfoCopyWith<$Res> implements $ModinfoCopyWith<$Res> {
  factory _$$_ModinfoCopyWith(
          _$_Modinfo value, $Res Function(_$_Modinfo) then) =
      __$$_ModinfoCopyWithImpl<$Res>;
  @override
  $Res call({String type, List<Mod> modList});
}

/// @nodoc
class __$$_ModinfoCopyWithImpl<$Res> extends _$ModinfoCopyWithImpl<$Res>
    implements _$$_ModinfoCopyWith<$Res> {
  __$$_ModinfoCopyWithImpl(_$_Modinfo _value, $Res Function(_$_Modinfo) _then)
      : super(_value, (v) => _then(v as _$_Modinfo));

  @override
  _$_Modinfo get _value => super._value as _$_Modinfo;

  @override
  $Res call({
    Object? type = freezed,
    Object? modList = freezed,
  }) {
    return _then(_$_Modinfo(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      modList: modList == freezed
          ? _value._modList
          : modList // ignore: cast_nullable_to_non_nullable
              as List<Mod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Modinfo implements _Modinfo {
  const _$_Modinfo({required this.type, required final List<Mod> modList})
      : _modList = modList;

  factory _$_Modinfo.fromJson(Map<String, dynamic> json) =>
      _$$_ModinfoFromJson(json);

  /// Mods type.
  @override
  final String type;

  /// Mods list.
  final List<Mod> _modList;

  /// Mods list.
  @override
  List<Mod> get modList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modList);
  }

  @override
  String toString() {
    return 'Modinfo(type: $type, modList: $modList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Modinfo &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other._modList, _modList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(_modList));

  @JsonKey(ignore: true)
  @override
  _$$_ModinfoCopyWith<_$_Modinfo> get copyWith =>
      __$$_ModinfoCopyWithImpl<_$_Modinfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModinfoToJson(this);
  }
}

abstract class _Modinfo implements Modinfo {
  const factory _Modinfo(
      {required final String type,
      required final List<Mod> modList}) = _$_Modinfo;

  factory _Modinfo.fromJson(Map<String, dynamic> json) = _$_Modinfo.fromJson;

  @override

  /// Mods type.
  String get type => throw _privateConstructorUsedError;
  @override

  /// Mods list.
  List<Mod> get modList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ModinfoCopyWith<_$_Modinfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Players _$PlayersFromJson(Map<String, dynamic> json) {
  return _Players.fromJson(json);
}

/// @nodoc
mixin _$Players {
  /// Max players.
  int get max => throw _privateConstructorUsedError;

  /// Connected players.
  int get online => throw _privateConstructorUsedError;

  /// Connected players list.
  List<Sample>? get sample => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayersCopyWith<Players> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayersCopyWith<$Res> {
  factory $PlayersCopyWith(Players value, $Res Function(Players) then) =
      _$PlayersCopyWithImpl<$Res>;
  $Res call({int max, int online, List<Sample>? sample});
}

/// @nodoc
class _$PlayersCopyWithImpl<$Res> implements $PlayersCopyWith<$Res> {
  _$PlayersCopyWithImpl(this._value, this._then);

  final Players _value;
  // ignore: unused_field
  final $Res Function(Players) _then;

  @override
  $Res call({
    Object? max = freezed,
    Object? online = freezed,
    Object? sample = freezed,
  }) {
    return _then(_value.copyWith(
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      online: online == freezed
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as int,
      sample: sample == freezed
          ? _value.sample
          : sample // ignore: cast_nullable_to_non_nullable
              as List<Sample>?,
    ));
  }
}

/// @nodoc
abstract class _$$_PlayersCopyWith<$Res> implements $PlayersCopyWith<$Res> {
  factory _$$_PlayersCopyWith(
          _$_Players value, $Res Function(_$_Players) then) =
      __$$_PlayersCopyWithImpl<$Res>;
  @override
  $Res call({int max, int online, List<Sample>? sample});
}

/// @nodoc
class __$$_PlayersCopyWithImpl<$Res> extends _$PlayersCopyWithImpl<$Res>
    implements _$$_PlayersCopyWith<$Res> {
  __$$_PlayersCopyWithImpl(_$_Players _value, $Res Function(_$_Players) _then)
      : super(_value, (v) => _then(v as _$_Players));

  @override
  _$_Players get _value => super._value as _$_Players;

  @override
  $Res call({
    Object? max = freezed,
    Object? online = freezed,
    Object? sample = freezed,
  }) {
    return _then(_$_Players(
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      online: online == freezed
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as int,
      sample: sample == freezed
          ? _value._sample
          : sample // ignore: cast_nullable_to_non_nullable
              as List<Sample>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Players implements _Players {
  const _$_Players(
      {required this.max, required this.online, final List<Sample>? sample})
      : _sample = sample;

  factory _$_Players.fromJson(Map<String, dynamic> json) =>
      _$$_PlayersFromJson(json);

  /// Max players.
  @override
  final int max;

  /// Connected players.
  @override
  final int online;

  /// Connected players list.
  final List<Sample>? _sample;

  /// Connected players list.
  @override
  List<Sample>? get sample {
    final value = _sample;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Players(max: $max, online: $online, sample: $sample)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Players &&
            const DeepCollectionEquality().equals(other.max, max) &&
            const DeepCollectionEquality().equals(other.online, online) &&
            const DeepCollectionEquality().equals(other._sample, _sample));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(max),
      const DeepCollectionEquality().hash(online),
      const DeepCollectionEquality().hash(_sample));

  @JsonKey(ignore: true)
  @override
  _$$_PlayersCopyWith<_$_Players> get copyWith =>
      __$$_PlayersCopyWithImpl<_$_Players>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayersToJson(this);
  }
}

abstract class _Players implements Players {
  const factory _Players(
      {required final int max,
      required final int online,
      final List<Sample>? sample}) = _$_Players;

  factory _Players.fromJson(Map<String, dynamic> json) = _$_Players.fromJson;

  @override

  /// Max players.
  int get max => throw _privateConstructorUsedError;
  @override

  /// Connected players.
  int get online => throw _privateConstructorUsedError;
  @override

  /// Connected players list.
  List<Sample>? get sample => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PlayersCopyWith<_$_Players> get copyWith =>
      throw _privateConstructorUsedError;
}

Sample _$SampleFromJson(Map<String, dynamic> json) {
  return _Sample.fromJson(json);
}

/// @nodoc
mixin _$Sample {
  /// Players' UUID.
  String get id => throw _privateConstructorUsedError;

  /// Players' name.
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SampleCopyWith<Sample> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleCopyWith<$Res> {
  factory $SampleCopyWith(Sample value, $Res Function(Sample) then) =
      _$SampleCopyWithImpl<$Res>;
  $Res call({String id, String name});
}

/// @nodoc
class _$SampleCopyWithImpl<$Res> implements $SampleCopyWith<$Res> {
  _$SampleCopyWithImpl(this._value, this._then);

  final Sample _value;
  // ignore: unused_field
  final $Res Function(Sample) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SampleCopyWith<$Res> implements $SampleCopyWith<$Res> {
  factory _$$_SampleCopyWith(_$_Sample value, $Res Function(_$_Sample) then) =
      __$$_SampleCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name});
}

/// @nodoc
class __$$_SampleCopyWithImpl<$Res> extends _$SampleCopyWithImpl<$Res>
    implements _$$_SampleCopyWith<$Res> {
  __$$_SampleCopyWithImpl(_$_Sample _value, $Res Function(_$_Sample) _then)
      : super(_value, (v) => _then(v as _$_Sample));

  @override
  _$_Sample get _value => super._value as _$_Sample;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Sample(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sample implements _Sample {
  const _$_Sample({required this.id, required this.name});

  factory _$_Sample.fromJson(Map<String, dynamic> json) =>
      _$$_SampleFromJson(json);

  /// Players' UUID.
  @override
  final String id;

  /// Players' name.
  @override
  final String name;

  @override
  String toString() {
    return 'Sample(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sample &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_SampleCopyWith<_$_Sample> get copyWith =>
      __$$_SampleCopyWithImpl<_$_Sample>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SampleToJson(this);
  }
}

abstract class _Sample implements Sample {
  const factory _Sample(
      {required final String id, required final String name}) = _$_Sample;

  factory _Sample.fromJson(Map<String, dynamic> json) = _$_Sample.fromJson;

  @override

  /// Players' UUID.
  String get id => throw _privateConstructorUsedError;
  @override

  /// Players' name.
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SampleCopyWith<_$_Sample> get copyWith =>
      throw _privateConstructorUsedError;
}

Version _$VersionFromJson(Map<String, dynamic> json) {
  return _Version.fromJson(json);
}

/// @nodoc
mixin _$Version {
  /// Version name.
  String get name => throw _privateConstructorUsedError;

  /// Version protocol.
  int get protocol => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionCopyWith<Version> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionCopyWith<$Res> {
  factory $VersionCopyWith(Version value, $Res Function(Version) then) =
      _$VersionCopyWithImpl<$Res>;
  $Res call({String name, int protocol});
}

/// @nodoc
class _$VersionCopyWithImpl<$Res> implements $VersionCopyWith<$Res> {
  _$VersionCopyWithImpl(this._value, this._then);

  final Version _value;
  // ignore: unused_field
  final $Res Function(Version) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? protocol = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_VersionCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$$_VersionCopyWith(
          _$_Version value, $Res Function(_$_Version) then) =
      __$$_VersionCopyWithImpl<$Res>;
  @override
  $Res call({String name, int protocol});
}

/// @nodoc
class __$$_VersionCopyWithImpl<$Res> extends _$VersionCopyWithImpl<$Res>
    implements _$$_VersionCopyWith<$Res> {
  __$$_VersionCopyWithImpl(_$_Version _value, $Res Function(_$_Version) _then)
      : super(_value, (v) => _then(v as _$_Version));

  @override
  _$_Version get _value => super._value as _$_Version;

  @override
  $Res call({
    Object? name = freezed,
    Object? protocol = freezed,
  }) {
    return _then(_$_Version(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Version implements _Version {
  const _$_Version({required this.name, required this.protocol});

  factory _$_Version.fromJson(Map<String, dynamic> json) =>
      _$$_VersionFromJson(json);

  /// Version name.
  @override
  final String name;

  /// Version protocol.
  @override
  final int protocol;

  @override
  String toString() {
    return 'Version(name: $name, protocol: $protocol)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Version &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.protocol, protocol));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(protocol));

  @JsonKey(ignore: true)
  @override
  _$$_VersionCopyWith<_$_Version> get copyWith =>
      __$$_VersionCopyWithImpl<_$_Version>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VersionToJson(this);
  }
}

abstract class _Version implements Version {
  const factory _Version(
      {required final String name, required final int protocol}) = _$_Version;

  factory _Version.fromJson(Map<String, dynamic> json) = _$_Version.fromJson;

  @override

  /// Version name.
  String get name => throw _privateConstructorUsedError;
  @override

  /// Version protocol.
  int get protocol => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VersionCopyWith<_$_Version> get copyWith =>
      throw _privateConstructorUsedError;
}

Mod _$ModFromJson(Map<String, dynamic> json) {
  return _Mod.fromJson(json);
}

/// @nodoc
mixin _$Mod {
  /// Mod id.
  String get modid => throw _privateConstructorUsedError;

  /// Mod version.
  String get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModCopyWith<Mod> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModCopyWith<$Res> {
  factory $ModCopyWith(Mod value, $Res Function(Mod) then) =
      _$ModCopyWithImpl<$Res>;
  $Res call({String modid, String version});
}

/// @nodoc
class _$ModCopyWithImpl<$Res> implements $ModCopyWith<$Res> {
  _$ModCopyWithImpl(this._value, this._then);

  final Mod _value;
  // ignore: unused_field
  final $Res Function(Mod) _then;

  @override
  $Res call({
    Object? modid = freezed,
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      modid: modid == freezed
          ? _value.modid
          : modid // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ModCopyWith<$Res> implements $ModCopyWith<$Res> {
  factory _$$_ModCopyWith(_$_Mod value, $Res Function(_$_Mod) then) =
      __$$_ModCopyWithImpl<$Res>;
  @override
  $Res call({String modid, String version});
}

/// @nodoc
class __$$_ModCopyWithImpl<$Res> extends _$ModCopyWithImpl<$Res>
    implements _$$_ModCopyWith<$Res> {
  __$$_ModCopyWithImpl(_$_Mod _value, $Res Function(_$_Mod) _then)
      : super(_value, (v) => _then(v as _$_Mod));

  @override
  _$_Mod get _value => super._value as _$_Mod;

  @override
  $Res call({
    Object? modid = freezed,
    Object? version = freezed,
  }) {
    return _then(_$_Mod(
      modid: modid == freezed
          ? _value.modid
          : modid // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Mod implements _Mod {
  const _$_Mod({required this.modid, required this.version});

  factory _$_Mod.fromJson(Map<String, dynamic> json) => _$$_ModFromJson(json);

  /// Mod id.
  @override
  final String modid;

  /// Mod version.
  @override
  final String version;

  @override
  String toString() {
    return 'Mod(modid: $modid, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Mod &&
            const DeepCollectionEquality().equals(other.modid, modid) &&
            const DeepCollectionEquality().equals(other.version, version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(modid),
      const DeepCollectionEquality().hash(version));

  @JsonKey(ignore: true)
  @override
  _$$_ModCopyWith<_$_Mod> get copyWith =>
      __$$_ModCopyWithImpl<_$_Mod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModToJson(this);
  }
}

abstract class _Mod implements Mod {
  const factory _Mod(
      {required final String modid, required final String version}) = _$_Mod;

  factory _Mod.fromJson(Map<String, dynamic> json) = _$_Mod.fromJson;

  @override

  /// Mod id.
  String get modid => throw _privateConstructorUsedError;
  @override

  /// Mod version.
  String get version => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ModCopyWith<_$_Mod> get copyWith => throw _privateConstructorUsedError;
}
