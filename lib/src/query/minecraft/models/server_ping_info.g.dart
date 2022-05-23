// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_ping_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServerPingInfo _$$_ServerPingInfoFromJson(Map<String, dynamic> json) =>
    _$_ServerPingInfo(
      version: Version.fromJson(json['version'] as Map<String, dynamic>),
      players: Players.fromJson(json['players'] as Map<String, dynamic>),
      description: _descriptionToJson(json['description']),
      favicon: json['favicon'] as String?,
      modinfo: json['modinfo'] == null
          ? null
          : Modinfo.fromJson(json['modinfo'] as Map<String, dynamic>),
      ping: json['ping'] as int?,
    );

Map<String, dynamic> _$$_ServerPingInfoToJson(_$_ServerPingInfo instance) =>
    <String, dynamic>{
      'version': instance.version,
      'players': instance.players,
      'description': instance.description,
      'favicon': instance.favicon,
      'modinfo': instance.modinfo,
      'ping': instance.ping,
    };

_$_Description _$$_DescriptionFromJson(Map<String, dynamic> json) =>
    _$_Description(
      extra: (json['extra'] as List<dynamic>?)
          ?.map((e) => Extra.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$_DescriptionToJson(_$_Description instance) =>
    <String, dynamic>{
      'extra': instance.extra,
      'text': instance.text,
    };

_$_Extra _$$_ExtraFromJson(Map<String, dynamic> json) => _$_Extra(
      color: json['color'] as String?,
      text: json['text'] as String,
      bold: json['bold'] as bool?,
      strikethrough: json['strikethrough'] as bool?,
      italic: json['italic'] as bool?,
      underlined: json['underlined'] as bool?,
    );

Map<String, dynamic> _$$_ExtraToJson(_$_Extra instance) => <String, dynamic>{
      'color': instance.color,
      'text': instance.text,
      'bold': instance.bold,
      'strikethrough': instance.strikethrough,
      'italic': instance.italic,
      'underlined': instance.underlined,
    };

_$_Modinfo _$$_ModinfoFromJson(Map<String, dynamic> json) => _$_Modinfo(
      type: json['type'] as String,
      modList: (json['modList'] as List<dynamic>)
          .map((e) => Mod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ModinfoToJson(_$_Modinfo instance) =>
    <String, dynamic>{
      'type': instance.type,
      'modList': instance.modList,
    };

_$_Players _$$_PlayersFromJson(Map<String, dynamic> json) => _$_Players(
      max: json['max'] as int,
      online: json['online'] as int,
      sample: (json['sample'] as List<dynamic>?)
          ?.map((e) => Sample.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlayersToJson(_$_Players instance) =>
    <String, dynamic>{
      'max': instance.max,
      'online': instance.online,
      'sample': instance.sample,
    };

_$_Sample _$$_SampleFromJson(Map<String, dynamic> json) => _$_Sample(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_SampleToJson(_$_Sample instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_Version _$$_VersionFromJson(Map<String, dynamic> json) => _$_Version(
      name: json['name'] as String,
      protocol: json['protocol'] as int,
    );

Map<String, dynamic> _$$_VersionToJson(_$_Version instance) =>
    <String, dynamic>{
      'name': instance.name,
      'protocol': instance.protocol,
    };

_$_Mod _$$_ModFromJson(Map<String, dynamic> json) => _$_Mod(
      modid: json['modid'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$$_ModToJson(_$_Mod instance) => <String, dynamic>{
      'modid': instance.modid,
      'version': instance.version,
    };
