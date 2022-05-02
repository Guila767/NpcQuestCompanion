
import 'package:elden_ring_quest_guide/src/local_repositories/local_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:injector/injector.dart';

import '../../model/npc_model.dart';

class NpcListViewController with ChangeNotifier {
  
  late final TextEditingController textEditingController = TextEditingController();
  final NpcDataRepo _dataRepo = Injector.appInstance.get<NpcDataRepo>();

  List<NpcModel> npcs = List.empty();

  NpcListViewController() {
    textEditingController.addListener(_filterListener);
    _dataRepo.init().whenComplete(() {
      npcs = _dataRepo.findAll();
      notifyListeners();
    });
  }

  void _filterListener() {
    var text = textEditingController.text;
    
    Iterable<NpcModel> it = _dataRepo.findAll();
    if(text.isEmpty) {
      npcs = it.toList();
    }
    else {
      npcs = it.where((element) => element.name.toLowerCase().contains(text.toLowerCase())).toList();
    }
    notifyListeners();
  }

}