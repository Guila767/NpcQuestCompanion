// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NpcModel _$NpcModelFromJson(Map<String, dynamic> json) => NpcModel(
      name: json['name'] as String,
      infoTable: InfoTable.fromJson(json['infoTable'] as Map<String, dynamic>),
      shopTable: (json['shopTable'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      mainContent: json['mainContent'] as String,
    );

Map<String, dynamic> _$NpcModelToJson(NpcModel instance) => <String, dynamic>{
      'name': instance.name,
      'infoTable': instance.infoTable,
      'shopTable': instance.shopTable,
      'mainContent': instance.mainContent,
    };

InfoTable _$InfoTableFromJson(Map<String, dynamic> json) => InfoTable(
      name: json['name'] as String,
      img: json['img'] as String,
      location: json['Location'] as String?,
      role: json['Role'] as String?,
      voicedBy: json['Voiced by'] as String?,
    );

Map<String, dynamic> _$InfoTableToJson(InfoTable instance) => <String, dynamic>{
      'name': instance.name,
      'img': instance.img,
      'Location': instance.location,
      'Role': instance.role,
      'Voiced by': instance.voicedBy,
    };
