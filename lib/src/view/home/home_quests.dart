import 'dart:ui';

import 'package:elden_ring_quest_guide/src/app_assets.dart';
import 'package:elden_ring_quest_guide/src/local_repositories/local_repository.dart';
import 'package:elden_ring_quest_guide/src/model/npc_model.dart';
import 'package:elden_ring_quest_guide/src/view/home/quest_card.dart';
import 'package:elden_ring_quest_guide/src/widgets/elden_ring_themed/elden_ring_box_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';


class OnGoingQuest extends StatefulWidget {
  OnGoingQuest({ Key? key }) : super(key: key);

  final NpcDataRepo npcRepo = Injector.appInstance.get<NpcDataRepo>();
  List<NpcModel> npcs = List.empty();
  
  @override
  State<OnGoingQuest> createState() => _OnGoingQuestState();
}

class _OnGoingQuestState extends State<OnGoingQuest> {

  @override
  initState() {
    super.initState();
    if(!widget.npcRepo.isInitialized) {
      widget.npcRepo.init().whenComplete(() {
        setState(() {
          widget.npcs = widget.npcRepo.findAll();    
        });
      });
    } 
    else {
      widget.npcs = widget.npcRepo.findAll();
    }

  }  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Card(
              borderOnForeground: true,
              elevation: 10.0,
              shadowColor: Colors.white.withAlpha(120),
              child: Container(
                decoration: BoxDecoration(
                  border: EldenRingBoxBorder(5.4), borderRadius: const BorderRadius.all(Radius.circular(1)),
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.art1)
                  )
                ),
                height: size.height * 0.13,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.001),
                  child: ClipRect(
                    clipBehavior: Clip.antiAlias,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          color: Colors.black.withAlpha(100),
                        ),
                        child: const Center(child: Text(
                          "Ongoing quests", 
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                      ),
                    ),
                  ),
                )
              )
            ),
          ),
          if(widget.npcs.isNotEmpty)
            Expanded(
              child: 
              ListView(
                children: [
                  QuestListItem(npc: widget.npcs[0]),
                  QuestListItem(npc: widget.npcs[1]),
                  QuestListItem(npc: widget.npcs[2]),
                  QuestListItem(npc: widget.npcs[3]),
                ],
              )
            )
        ],
      ),

    );
  }
}