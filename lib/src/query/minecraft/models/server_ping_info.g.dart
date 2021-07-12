// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_ping_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServerPingInfo _$_$_ServerPingInfoFromJson(Map<String, dynamic> json) {
  return _$_ServerPingInfo(
    version: Version.fromJson(json['version'] as Map<String, dynamic>),
    players: Players.fromJson(json['players'] as Map<String, dynamic>),
    description: _descriptionToJson(json['description']),
    favicon: json['favicon'] as String?,
    modinfo: json['modinfo'] == null
        ? null
        : Modinfo.fromJson(json['modinfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ServerPingInfoToJson(_$_ServerPingInfo instance) =>
    <String, dynamic>{
      'version': instance.version,
      'players': instance.players,
      'description': instance.description,
      'favicon': instance.favicon,
      'modinfo': instance.modinfo,
    };

_$_Description _$_$_DescriptionFromJson(Map<String, dynamic> json) {
  return _$_Description(
    extra: (json['extra'] as List<dynamic>?)
        ?.map((e) => Extra.fromJson(e as Map<String, dynamic>))
        .toList(),
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$_$_DescriptionToJson(_$_Description instance) =>
    <String, dynamic>{
      'extra': instance.extra,
      'text': instance.text,
    };

_$_Extra _$_$_ExtraFromJson(Map<String, dynamic> json) {
  return _$_Extra(
    color: json['color'] as String?,
    text: json['text'] as String,
    bold: json['bold'] as bool?,
    strikethrough: json['strikethrough'] as bool?,
    italic: json['italic'] as bool?,
    underlined: json['underlined'] as bool?,
  );
}

Map<String, dynamic> _$_$_ExtraToJson(_$_Extra instance) => <String, dynamic>{
      'color': instance.color,
      'text': instance.text,
      'bold': instance.bold,
      'strikethrough': instance.strikethrough,
      'italic': instance.italic,
      'underlined': instance.underlined,
    };

_$_Modinfo _$_$_ModinfoFromJson(Map<String, dynamic> json) {
  return _$_Modinfo(
    type: json['type'] as String,
    modList: (json['modList'] as List<dynamic>)
        .map((e) => Mod.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ModinfoToJson(_$_Modinfo instance) =>
    <String, dynamic>{
      'type': instance.type,
      'modList': instance.modList,
    };

_$_Players _$_$_PlayersFromJson(Map<String, dynamic> json) {
  return _$_Players(
    max: json['max'] as int,
    online: json['online'] as int,
    sample: (json['sample'] as List<dynamic>?)
        ?.map((e) => Sample.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_PlayersToJson(_$_Players instance) =>
    <String, dynamic>{
      'max': instance.max,
      'online': instance.online,
      'sample': instance.sample,
    };

_$_Sample _$_$_SampleFromJson(Map<String, dynamic> json) {
  return _$_Sample(
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$_$_SampleToJson(_$_Sample instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_Version _$_$_VersionFromJson(Map<String, dynamic> json) {
  return _$_Version(
    name: json['name'] as String,
    protocol: json['protocol'] as int,
  );
}

Map<String, dynamic> _$_$_VersionToJson(_$_Version instance) =>
    <String, dynamic>{
      'name': instance.name,
      'protocol': instance.protocol,
    };

_$_Mod _$_$_ModFromJson(Map<String, dynamic> json) {
  return _$_Mod(
    modid: json['modid'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$_$_ModToJson(_$_Mod instance) => <String, dynamic>{
      'modid': instance.modid,
      'version': instance.version,
    };
