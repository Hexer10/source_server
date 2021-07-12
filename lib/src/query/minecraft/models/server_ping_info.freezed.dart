// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'server_ping_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServerPingInfo _$ServerPingInfoFromJson(Map<String, dynamic> json) {
  return _ServerPingInfo.fromJson(json);
}

/// @nodoc
class _$ServerPingInfoTearOff {
  const _$ServerPingInfoTearOff();

  _ServerPingInfo call(
      {required Version version,
      required Players players,
      @JsonKey(fromJson: _descriptionToJson) required Description description,
      String? favicon,
      Modinfo? modinfo}) {
    return _ServerPingInfo(
      version: version,
      players: players,
      description: description,
      favicon: favicon,
      modinfo: modinfo,
    );
  }

  ServerPingInfo fromJson(Map<String, Object> json) {
    return ServerPingInfo.fromJson(json);
  }
}

/// @nodoc
const $ServerPingInfo = _$ServerPingInfoTearOff();

/// @nodoc
mixin _$ServerPingInfo {
  /// Server and protocol version.
  Version get version => throw _privateConstructorUsedError;

  /// Total and connected players.
  Players get players => throw _privateConstructorUsedError;

  /// MOTD description.
  @JsonKey(fromJson: _descriptionToJson)
  Description get description => throw _privateConstructorUsedError;

  /// Favicon data uri.
  String? get favicon => throw _privateConstructorUsedError;

  /// Server's mods.
  Modinfo? get modinfo => throw _privateConstructorUsedError;

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
      Modinfo? modinfo});

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
abstract class _$ServerPingInfoCopyWith<$Res>
    implements $ServerPingInfoCopyWith<$Res> {
  factory _$ServerPingInfoCopyWith(
          _ServerPingInfo value, $Res Function(_ServerPingInfo) then) =
      __$ServerPingInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {Version version,
      Players players,
      @JsonKey(fromJson: _descriptionToJson) Description description,
      String? favicon,
      Modinfo? modinfo});

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
class __$ServerPingInfoCopyWithImpl<$Res>
    extends _$ServerPingInfoCopyWithImpl<$Res>
    implements _$ServerPingInfoCopyWith<$Res> {
  __$ServerPingInfoCopyWithImpl(
      _ServerPingInfo _value, $Res Function(_ServerPingInfo) _then)
      : super(_value, (v) => _then(v as _ServerPingInfo));

  @override
  _ServerPingInfo get _value => super._value as _ServerPingInfo;

  @override
  $Res call({
    Object? version = freezed,
    Object? players = freezed,
    Object? description = freezed,
    Object? favicon = freezed,
    Object? modinfo = freezed,
  }) {
    return _then(_ServerPingInfo(
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
      this.modinfo});

  factory _$_ServerPingInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_ServerPingInfoFromJson(json);

  @override

  /// Server and protocol version.
  final Version version;
  @override

  /// Total and connected players.
  final Players players;
  @override

  /// MOTD description.
  @JsonKey(fromJson: _descriptionToJson)
  final Description description;
  @override

  /// Favicon data uri.
  final String? favicon;
  @override

  /// Server's mods.
  final Modinfo? modinfo;

  @override
  String toString() {
    return 'ServerPingInfo(version: $version, players: $players, description: $description, favicon: $favicon, modinfo: $modinfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServerPingInfo &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.players, players) ||
                const DeepCollectionEquality()
                    .equals(other.players, players)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.favicon, favicon) ||
                const DeepCollectionEquality()
                    .equals(other.favicon, favicon)) &&
            (identical(other.modinfo, modinfo) ||
                const DeepCollectionEquality().equals(other.modinfo, modinfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(players) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(favicon) ^
      const DeepCollectionEquality().hash(modinfo);

  @JsonKey(ignore: true)
  @override
  _$ServerPingInfoCopyWith<_ServerPingInfo> get copyWith =>
      __$ServerPingInfoCopyWithImpl<_ServerPingInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServerPingInfoToJson(this);
  }
}

abstract class _ServerPingInfo implements ServerPingInfo {
  const factory _ServerPingInfo(
      {required Version version,
      required Players players,
      @JsonKey(fromJson: _descriptionToJson) required Description description,
      String? favicon,
      Modinfo? modinfo}) = _$_ServerPingInfo;

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
  @JsonKey(fromJson: _descriptionToJson)
  Description get description => throw _privateConstructorUsedError;
  @override

  /// Favicon data uri.
  String? get favicon => throw _privateConstructorUsedError;
  @override

  /// Server's mods.
  Modinfo? get modinfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServerPingInfoCopyWith<_ServerPingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Description _$DescriptionFromJson(Map<String, dynamic> json) {
  return _Description.fromJson(json);
}

/// @nodoc
class _$DescriptionTearOff {
  const _$DescriptionTearOff();

  _Description call({List<Extra>? extra, required String text}) {
    return _Description(
      extra: extra,
      text: text,
    );
  }

  Description fromJson(Map<String, Object> json) {
    return Description.fromJson(json);
  }
}

/// @nodoc
const $Description = _$DescriptionTearOff();

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
abstract class _$DescriptionCopyWith<$Res>
    implements $DescriptionCopyWith<$Res> {
  factory _$DescriptionCopyWith(
          _Description value, $Res Function(_Description) then) =
      __$DescriptionCopyWithImpl<$Res>;
  @override
  $Res call({List<Extra>? extra, String text});
}

/// @nodoc
class __$DescriptionCopyWithImpl<$Res> extends _$DescriptionCopyWithImpl<$Res>
    implements _$DescriptionCopyWith<$Res> {
  __$DescriptionCopyWithImpl(
      _Description _value, $Res Function(_Description) _then)
      : super(_value, (v) => _then(v as _Description));

  @override
  _Description get _value => super._value as _Description;

  @override
  $Res call({
    Object? extra = freezed,
    Object? text = freezed,
  }) {
    return _then(_Description(
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
@JsonSerializable()
class _$_Description implements _Description {
  const _$_Description({this.extra, required this.text});

  factory _$_Description.fromJson(Map<String, dynamic> json) =>
      _$_$_DescriptionFromJson(json);

  @override

  /// Extra MOTD text.
  final List<Extra>? extra;
  @override

  /// Motd text.
  final String text;

  @override
  String toString() {
    return 'Description(extra: $extra, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Description &&
            (identical(other.extra, extra) ||
                const DeepCollectionEquality().equals(other.extra, extra)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(extra) ^
      const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  _$DescriptionCopyWith<_Description> get copyWith =>
      __$DescriptionCopyWithImpl<_Description>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DescriptionToJson(this);
  }
}

abstract class _Description implements Description {
  const factory _Description({List<Extra>? extra, required String text}) =
      _$_Description;

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
  _$DescriptionCopyWith<_Description> get copyWith =>
      throw _privateConstructorUsedError;
}

Extra _$ExtraFromJson(Map<String, dynamic> json) {
  return _Extra.fromJson(json);
}

/// @nodoc
class _$ExtraTearOff {
  const _$ExtraTearOff();

  _Extra call(
      {String? color,
      required String text,
      bool? bold,
      bool? strikethrough,
      bool? italic,
      bool? underlined}) {
    return _Extra(
      color: color,
      text: text,
      bold: bold,
      strikethrough: strikethrough,
      italic: italic,
      underlined: underlined,
    );
  }

  Extra fromJson(Map<String, Object> json) {
    return Extra.fromJson(json);
  }
}

/// @nodoc
const $Extra = _$ExtraTearOff();

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
abstract class _$ExtraCopyWith<$Res> implements $ExtraCopyWith<$Res> {
  factory _$ExtraCopyWith(_Extra value, $Res Function(_Extra) then) =
      __$ExtraCopyWithImpl<$Res>;
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
class __$ExtraCopyWithImpl<$Res> extends _$ExtraCopyWithImpl<$Res>
    implements _$ExtraCopyWith<$Res> {
  __$ExtraCopyWithImpl(_Extra _value, $Res Function(_Extra) _then)
      : super(_value, (v) => _then(v as _Extra));

  @override
  _Extra get _value => super._value as _Extra;

  @override
  $Res call({
    Object? color = freezed,
    Object? text = freezed,
    Object? bold = freezed,
    Object? strikethrough = freezed,
    Object? italic = freezed,
    Object? underlined = freezed,
  }) {
    return _then(_Extra(
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
      _$_$_ExtraFromJson(json);

  @override

  /// Text color.
  final String? color;
  @override

  /// Actual text.
  final String text;
  @override

  /// Bold text.
  final bool? bold;
  @override

  /// Strikethrough text.
  final bool? strikethrough;
  @override

  /// Italic text.
  final bool? italic;
  @override

  /// Underlined text.
  final bool? underlined;

  @override
  String toString() {
    return 'Extra(color: $color, text: $text, bold: $bold, strikethrough: $strikethrough, italic: $italic, underlined: $underlined)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Extra &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.bold, bold) ||
                const DeepCollectionEquality().equals(other.bold, bold)) &&
            (identical(other.strikethrough, strikethrough) ||
                const DeepCollectionEquality()
                    .equals(other.strikethrough, strikethrough)) &&
            (identical(other.italic, italic) ||
                const DeepCollectionEquality().equals(other.italic, italic)) &&
            (identical(other.underlined, underlined) ||
                const DeepCollectionEquality()
                    .equals(other.underlined, underlined)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(bold) ^
      const DeepCollectionEquality().hash(strikethrough) ^
      const DeepCollectionEquality().hash(italic) ^
      const DeepCollectionEquality().hash(underlined);

  @JsonKey(ignore: true)
  @override
  _$ExtraCopyWith<_Extra> get copyWith =>
      __$ExtraCopyWithImpl<_Extra>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ExtraToJson(this);
  }
}

abstract class _Extra implements Extra {
  const factory _Extra(
      {String? color,
      required String text,
      bool? bold,
      bool? strikethrough,
      bool? italic,
      bool? underlined}) = _$_Extra;

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
  _$ExtraCopyWith<_Extra> get copyWith => throw _privateConstructorUsedError;
}

Modinfo _$ModinfoFromJson(Map<String, dynamic> json) {
  return _Modinfo.fromJson(json);
}

/// @nodoc
class _$ModinfoTearOff {
  const _$ModinfoTearOff();

  _Modinfo call({required String type, required List<Mod> modList}) {
    return _Modinfo(
      type: type,
      modList: modList,
    );
  }

  Modinfo fromJson(Map<String, Object> json) {
    return Modinfo.fromJson(json);
  }
}

/// @nodoc
const $Modinfo = _$ModinfoTearOff();

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
abstract class _$ModinfoCopyWith<$Res> implements $ModinfoCopyWith<$Res> {
  factory _$ModinfoCopyWith(_Modinfo value, $Res Function(_Modinfo) then) =
      __$ModinfoCopyWithImpl<$Res>;
  @override
  $Res call({String type, List<Mod> modList});
}

/// @nodoc
class __$ModinfoCopyWithImpl<$Res> extends _$ModinfoCopyWithImpl<$Res>
    implements _$ModinfoCopyWith<$Res> {
  __$ModinfoCopyWithImpl(_Modinfo _value, $Res Function(_Modinfo) _then)
      : super(_value, (v) => _then(v as _Modinfo));

  @override
  _Modinfo get _value => super._value as _Modinfo;

  @override
  $Res call({
    Object? type = freezed,
    Object? modList = freezed,
  }) {
    return _then(_Modinfo(
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
@JsonSerializable()
class _$_Modinfo implements _Modinfo {
  const _$_Modinfo({required this.type, required this.modList});

  factory _$_Modinfo.fromJson(Map<String, dynamic> json) =>
      _$_$_ModinfoFromJson(json);

  @override

  /// Mods type.
  final String type;
  @override

  /// Mods list.
  final List<Mod> modList;

  @override
  String toString() {
    return 'Modinfo(type: $type, modList: $modList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Modinfo &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.modList, modList) ||
                const DeepCollectionEquality().equals(other.modList, modList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(modList);

  @JsonKey(ignore: true)
  @override
  _$ModinfoCopyWith<_Modinfo> get copyWith =>
      __$ModinfoCopyWithImpl<_Modinfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ModinfoToJson(this);
  }
}

abstract class _Modinfo implements Modinfo {
  const factory _Modinfo({required String type, required List<Mod> modList}) =
      _$_Modinfo;

  factory _Modinfo.fromJson(Map<String, dynamic> json) = _$_Modinfo.fromJson;

  @override

  /// Mods type.
  String get type => throw _privateConstructorUsedError;
  @override

  /// Mods list.
  List<Mod> get modList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ModinfoCopyWith<_Modinfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Players _$PlayersFromJson(Map<String, dynamic> json) {
  return _Players.fromJson(json);
}

/// @nodoc
class _$PlayersTearOff {
  const _$PlayersTearOff();

  _Players call({required int max, required int online, List<Sample>? sample}) {
    return _Players(
      max: max,
      online: online,
      sample: sample,
    );
  }

  Players fromJson(Map<String, Object> json) {
    return Players.fromJson(json);
  }
}

/// @nodoc
const $Players = _$PlayersTearOff();

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
abstract class _$PlayersCopyWith<$Res> implements $PlayersCopyWith<$Res> {
  factory _$PlayersCopyWith(_Players value, $Res Function(_Players) then) =
      __$PlayersCopyWithImpl<$Res>;
  @override
  $Res call({int max, int online, List<Sample>? sample});
}

/// @nodoc
class __$PlayersCopyWithImpl<$Res> extends _$PlayersCopyWithImpl<$Res>
    implements _$PlayersCopyWith<$Res> {
  __$PlayersCopyWithImpl(_Players _value, $Res Function(_Players) _then)
      : super(_value, (v) => _then(v as _Players));

  @override
  _Players get _value => super._value as _Players;

  @override
  $Res call({
    Object? max = freezed,
    Object? online = freezed,
    Object? sample = freezed,
  }) {
    return _then(_Players(
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
@JsonSerializable()
class _$_Players implements _Players {
  const _$_Players({required this.max, required this.online, this.sample});

  factory _$_Players.fromJson(Map<String, dynamic> json) =>
      _$_$_PlayersFromJson(json);

  @override

  /// Max players.
  final int max;
  @override

  /// Connected players.
  final int online;
  @override

  /// Connected players list.
  final List<Sample>? sample;

  @override
  String toString() {
    return 'Players(max: $max, online: $online, sample: $sample)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Players &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)) &&
            (identical(other.online, online) ||
                const DeepCollectionEquality().equals(other.online, online)) &&
            (identical(other.sample, sample) ||
                const DeepCollectionEquality().equals(other.sample, sample)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(max) ^
      const DeepCollectionEquality().hash(online) ^
      const DeepCollectionEquality().hash(sample);

  @JsonKey(ignore: true)
  @override
  _$PlayersCopyWith<_Players> get copyWith =>
      __$PlayersCopyWithImpl<_Players>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlayersToJson(this);
  }
}

abstract class _Players implements Players {
  const factory _Players(
      {required int max,
      required int online,
      List<Sample>? sample}) = _$_Players;

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
  _$PlayersCopyWith<_Players> get copyWith =>
      throw _privateConstructorUsedError;
}

Sample _$SampleFromJson(Map<String, dynamic> json) {
  return _Sample.fromJson(json);
}

/// @nodoc
class _$SampleTearOff {
  const _$SampleTearOff();

  _Sample call({required String id, required String name}) {
    return _Sample(
      id: id,
      name: name,
    );
  }

  Sample fromJson(Map<String, Object> json) {
    return Sample.fromJson(json);
  }
}

/// @nodoc
const $Sample = _$SampleTearOff();

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
abstract class _$SampleCopyWith<$Res> implements $SampleCopyWith<$Res> {
  factory _$SampleCopyWith(_Sample value, $Res Function(_Sample) then) =
      __$SampleCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name});
}

/// @nodoc
class __$SampleCopyWithImpl<$Res> extends _$SampleCopyWithImpl<$Res>
    implements _$SampleCopyWith<$Res> {
  __$SampleCopyWithImpl(_Sample _value, $Res Function(_Sample) _then)
      : super(_value, (v) => _then(v as _Sample));

  @override
  _Sample get _value => super._value as _Sample;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_Sample(
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
      _$_$_SampleFromJson(json);

  @override

  /// Players' UUID.
  final String id;
  @override

  /// Players' name.
  final String name;

  @override
  String toString() {
    return 'Sample(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Sample &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$SampleCopyWith<_Sample> get copyWith =>
      __$SampleCopyWithImpl<_Sample>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SampleToJson(this);
  }
}

abstract class _Sample implements Sample {
  const factory _Sample({required String id, required String name}) = _$_Sample;

  factory _Sample.fromJson(Map<String, dynamic> json) = _$_Sample.fromJson;

  @override

  /// Players' UUID.
  String get id => throw _privateConstructorUsedError;
  @override

  /// Players' name.
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SampleCopyWith<_Sample> get copyWith => throw _privateConstructorUsedError;
}

Version _$VersionFromJson(Map<String, dynamic> json) {
  return _Version.fromJson(json);
}

/// @nodoc
class _$VersionTearOff {
  const _$VersionTearOff();

  _Version call({required String name, required int protocol}) {
    return _Version(
      name: name,
      protocol: protocol,
    );
  }

  Version fromJson(Map<String, Object> json) {
    return Version.fromJson(json);
  }
}

/// @nodoc
const $Version = _$VersionTearOff();

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
abstract class _$VersionCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$VersionCopyWith(_Version value, $Res Function(_Version) then) =
      __$VersionCopyWithImpl<$Res>;
  @override
  $Res call({String name, int protocol});
}

/// @nodoc
class __$VersionCopyWithImpl<$Res> extends _$VersionCopyWithImpl<$Res>
    implements _$VersionCopyWith<$Res> {
  __$VersionCopyWithImpl(_Version _value, $Res Function(_Version) _then)
      : super(_value, (v) => _then(v as _Version));

  @override
  _Version get _value => super._value as _Version;

  @override
  $Res call({
    Object? name = freezed,
    Object? protocol = freezed,
  }) {
    return _then(_Version(
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
      _$_$_VersionFromJson(json);

  @override

  /// Version name.
  final String name;
  @override

  /// Version protocol.
  final int protocol;

  @override
  String toString() {
    return 'Version(name: $name, protocol: $protocol)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Version &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.protocol, protocol) ||
                const DeepCollectionEquality()
                    .equals(other.protocol, protocol)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(protocol);

  @JsonKey(ignore: true)
  @override
  _$VersionCopyWith<_Version> get copyWith =>
      __$VersionCopyWithImpl<_Version>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_VersionToJson(this);
  }
}

abstract class _Version implements Version {
  const factory _Version({required String name, required int protocol}) =
      _$_Version;

  factory _Version.fromJson(Map<String, dynamic> json) = _$_Version.fromJson;

  @override

  /// Version name.
  String get name => throw _privateConstructorUsedError;
  @override

  /// Version protocol.
  int get protocol => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VersionCopyWith<_Version> get copyWith =>
      throw _privateConstructorUsedError;
}

Mod _$ModFromJson(Map<String, dynamic> json) {
  return _Mod.fromJson(json);
}

/// @nodoc
class _$ModTearOff {
  const _$ModTearOff();

  _Mod call({required String modid, required String version}) {
    return _Mod(
      modid: modid,
      version: version,
    );
  }

  Mod fromJson(Map<String, Object> json) {
    return Mod.fromJson(json);
  }
}

/// @nodoc
const $Mod = _$ModTearOff();

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
abstract class _$ModCopyWith<$Res> implements $ModCopyWith<$Res> {
  factory _$ModCopyWith(_Mod value, $Res Function(_Mod) then) =
      __$ModCopyWithImpl<$Res>;
  @override
  $Res call({String modid, String version});
}

/// @nodoc
class __$ModCopyWithImpl<$Res> extends _$ModCopyWithImpl<$Res>
    implements _$ModCopyWith<$Res> {
  __$ModCopyWithImpl(_Mod _value, $Res Function(_Mod) _then)
      : super(_value, (v) => _then(v as _Mod));

  @override
  _Mod get _value => super._value as _Mod;

  @override
  $Res call({
    Object? modid = freezed,
    Object? version = freezed,
  }) {
    return _then(_Mod(
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

  factory _$_Mod.fromJson(Map<String, dynamic> json) => _$_$_ModFromJson(json);

  @override

  /// Mod id.
  final String modid;
  @override

  /// Mod version.
  final String version;

  @override
  String toString() {
    return 'Mod(modid: $modid, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Mod &&
            (identical(other.modid, modid) ||
                const DeepCollectionEquality().equals(other.modid, modid)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(other.version, version)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(modid) ^
      const DeepCollectionEquality().hash(version);

  @JsonKey(ignore: true)
  @override
  _$ModCopyWith<_Mod> get copyWith =>
      __$ModCopyWithImpl<_Mod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ModToJson(this);
  }
}

abstract class _Mod implements Mod {
  const factory _Mod({required String modid, required String version}) = _$_Mod;

  factory _Mod.fromJson(Map<String, dynamic> json) = _$_Mod.fromJson;

  @override

  /// Mod id.
  String get modid => throw _privateConstructorUsedError;
  @override

  /// Mod version.
  String get version => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ModCopyWith<_Mod> get copyWith => throw _privateConstructorUsedError;
}
