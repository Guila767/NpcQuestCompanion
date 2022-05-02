import 'dart:convert';
import 'package:elden_ring_quest_guide/src/model/npc_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

abstract class DataRepository<T extends DataModel<T>> {
  T? findOne(Object? id, Map<String, String>? params);
  List<T> findAll(Object? id, Map<String, String>? params);
  Future<void> init();
}

class JsonConverter<T> {
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  JsonConverter(
    {
      required this.fromJson,
      required this.toJson
    }
  );
}

abstract class DataModel<T> implements Equatable {
  Object? get id;
  JsonConverter<T> get getConverter;
}

abstract class JsonDataRepository<T extends DataModel<T>> extends DataRepository<T> {
  
  bool get isInitialized => _data != null;

  @override
  List<T> findAll([Object? id, Map<String, dynamic>? params]) {
    if(_data == null) {
      return List.empty();
    }
    Iterable<T> it = _data!;
    if(id != null) {
      it = _data!.where((element) => element.id == id);
    }
    var jsConverter = getInstance.getConverter;
    if(params != null) {
      it = it.where((element) {
        var obj = jsConverter.toJson(element);
        return params.keys.every((key) {
          try{
            var keyName = obj.keys.firstWhere((objKey) => objKey == key);
            return obj[keyName] == params[keyName];
          }
          catch (_) { return false; }
        });
      });
    }
    return it.toList();
  }

  @override
  T? findOne([Object? id, Map<String, dynamic>? params]) {

    var all = findAll(id, params);
    if(all.isEmpty){
      return null;
    }
    return all.first;
  }

  @override
  Future<void> init() async {
    if(_data != null) {
      return;
    }

    var jsConverter = getInstance.getConverter;

    var jsonStr = await loadJsonStr();
    dynamic js = await json.decode(jsonStr);
    try {
      var data = js as List<dynamic>;
      _data = [];
      for (var element in data) { 
        _data!.add(jsConverter.fromJson(element as Map<String, dynamic>));
      } 
    }
    catch (_) {
      _data = [jsConverter.fromJson(js as Map<String, dynamic>)];
    }
  }

  @protected
  Future<String> loadJsonStr();
  @protected
  T get getInstance;
  List<T>? _data;
}

class NpcDataRepo extends JsonDataRepository<NpcModel> {

  final String _repositoryPath = 'lib/data/NPCs.json';

  @override
  @protected
  Future<String> loadJsonStr() async => await rootBundle.loadString(_repositoryPath);

  @override
  @protected
  NpcModel get getInstance => NpcModel.getInstance;
}

