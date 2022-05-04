import 'package:cached_network_image/cached_network_image.dart';
import 'package:elden_ring_quest_guide/src/model/npc_model.dart';
import 'package:flutter/material.dart';

class QuestListItem extends StatelessWidget {
  
  final NpcModel npc;
  
  const QuestListItem({ Key? key, required this.npc }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(npc.name),
        leading: CachedNetworkImage(
          height: 120, width: 120,
          placeholder: (ctx, _) => const CircularProgressIndicator(),
          imageUrl: 'https://eldenring.wiki.fextralife.com${npc.infoTable.img}',
          imageBuilder: (ctx, imgProvider) => CircleAvatar(
            foregroundImage: imgProvider,
          )
        ),
      ),
    );
  }
}