// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NpcModel _$NpcModelFromJson(Map<String, dynamic> json) => NpcModel(
      img: json['img'] as String,
      name: json['name'] as String,
      location: json['Location'] as String?,
      role: json['Role'] as String?,
      voicedBy: json['Voiced by'] as String?,
    );

Map<String, dynamic> _$NpcModelToJson(NpcModel instance) => <String, dynamic>{
      'img': instance.img,
      'name': instance.name,
      'Location': instance.location,
      'Role': instance.role,
      'Voiced by': instance.voicedBy,
    };
