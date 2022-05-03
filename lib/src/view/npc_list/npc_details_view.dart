import 'package:cached_network_image/cached_network_image.dart';
import 'package:elden_ring_quest_guide/src/app_colors.dart';
import 'package:elden_ring_quest_guide/src/local_repositories/local_repository.dart';
import 'package:elden_ring_quest_guide/src/model/npc_model.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

import '../../widgets/elden_ring_themed/elden_ring_box_border.dart';

/// Displays detailed information about a SampleItem.
class NpcDetailsView extends StatelessWidget {
  NpcDetailsView({Key? key}) : super(key: key);

  static const routeName = '/NpcDetails';
  
  final NpcDataRepo npcRepo = Injector.appInstance.get<NpcDataRepo>();

  @override
  Widget build(BuildContext context) {

    var npcId = ModalRoute.of(context)!.settings.arguments as int;
    var npc = npcRepo.findOne(npcId) ?? NpcModel.getInstance;
    var scrSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(npc.name),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CachedNetworkImage(
            imageUrl: 'https://eldenring.wiki.fextralife.com${npc.img}',
            imageBuilder: (ctx, imgProvider) => Container(
              width: 120, height: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(image: imgProvider, fit: BoxFit.cover),
                border: EldenRingBoxBorder()
              )
            ),
          ),
          const Divider(color: AppColors.baseColor,height: 20, thickness: 2.0),
          Padding(
            padding: EdgeInsets.only(left: scrSize.width * 0.1, right: scrSize.width * 0.1),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                color: AppColors.baseColor
              ),
              children: [
                // TODO: Use localization for the text
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('Name'),
                  ), 
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(npc.name),
                  )
                ]),
                TableRow(children: [ 
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('Location'),
                  ), 
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(npc.location ?? 'Unknown'),
                  )
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('Role'),
                  ), 
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(npc.role ?? 'Unknown'),
                  )
                ])
              ]
            )
          ),
        ],
      )
    );
  }
}
