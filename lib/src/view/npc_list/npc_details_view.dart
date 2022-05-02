import 'package:elden_ring_quest_guide/src/local_repositories/local_repository.dart';
import 'package:elden_ring_quest_guide/src/model/npc_model.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

/// Displays detailed information about a SampleItem.
class NpcDetailsView extends StatelessWidget {
  NpcDetailsView({Key? key}) : super(key: key);

  static const routeName = '/NpcDetails';
  
  final NpcDataRepo npcRepo = Injector.appInstance.get<NpcDataRepo>();

  @override
  Widget build(BuildContext context) {

    var npcId = ModalRoute.of(context)!.settings.arguments as int;
    var npc = npcRepo.findOne(npcId) ?? NpcModel.getInstance;

    return Scaffold(
      appBar: AppBar(
        title: Text(npc.name),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
