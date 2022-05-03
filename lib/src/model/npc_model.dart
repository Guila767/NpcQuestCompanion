import 'package:elden_ring_quest_guide/src/local_repositories/local_repository.dart' as repo;
import 'package:json_annotation/json_annotation.dart';

part 'npc_model.g.dart';

@JsonSerializable()
class NpcModel extends repo.DataModel<NpcModel> {
  
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'infoTable')
  final InfoTable infoTable;
  @JsonKey(name: 'shopTable')
  final List<List<String>>? shopTable;
  @JsonKey(name: 'mainContent')
  final String mainContent;
  
  NpcModel({required this.name, required this.infoTable, this.shopTable, required this.mainContent});
  NpcModel._() : this(name: '', infoTable: InfoTable.empty, mainContent: '');

  @override
  Object? get id => name.hashCode;

  factory NpcModel.fromJson(Map<String, dynamic> json) => _$NpcModelFromJson(json);
  Map<String, dynamic> toJson() => _$NpcModelToJson(this);

  @override
  repo.JsonConverter<NpcModel> get getConverter => converter;

  static NpcModel get getInstance => NpcModel._();
  
  @override
  List<Object?> get props => [name, mainContent];

  @override
  bool? get stringify => true;

  static final repo.JsonConverter<NpcModel> converter = repo.JsonConverter<NpcModel>(
    fromJson: _$NpcModelFromJson,
    toJson: _$NpcModelToJson
  );
}

@JsonSerializable()
class InfoTable {

  static InfoTable get empty => InfoTable._();
  
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'img')
  final String img;
  @JsonKey(name: 'Location')
  final String? location;
  @JsonKey(name: 'Role')
  final String? role;
  @JsonKey(name: 'Voiced by')
  final String? voicedBy;

  InfoTable({ required this.name, required this.img, this.location, this.role, this.voicedBy});
  InfoTable._() : this(name: '', img: '');

  factory InfoTable.fromJson(Map<String, dynamic> json) => _$InfoTableFromJson(json);

  Map<String, dynamic> toJson() => _$InfoTableToJson(this);
}