import 'package:elden_ring_quest_guide/src/local_repositories/local_repository.dart' as repo;
import 'package:json_annotation/json_annotation.dart';

part 'npc_model.g.dart';

@JsonSerializable()
class NpcModel extends repo.DataModel<NpcModel> {
  
  final String img;
  final String name;
  @JsonKey(name: 'Location')
  final String? location;
  @JsonKey(name: 'Role')
  final String? role;
  @JsonKey(name: 'Voiced by')
  final String? voicedBy;
  
  NpcModel({required this.img, required this.name, required this.location, required this.role, this.voicedBy});
  NpcModel._() : this(img: '', name: '', location: '', role:'');

  @override
  Object? get id => name.hashCode;

  factory NpcModel.fromJson(Map<String, dynamic> json) => _$NpcModelFromJson(json);
  Map<String, dynamic> toJson() => _$NpcModelToJson(this);

  @override
  repo.JsonConverter<NpcModel> get getConverter => converter;

  static NpcModel get getInstance => NpcModel._();
  
  @override
  List<Object?> get props => [name, location, role, voicedBy];

  @override
  bool? get stringify => true;

  static final repo.JsonConverter<NpcModel> converter = repo.JsonConverter<NpcModel>(
    fromJson: _$NpcModelFromJson,
    toJson: _$NpcModelToJson
  );
}