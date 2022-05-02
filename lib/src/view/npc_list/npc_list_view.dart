import 'package:elden_ring_quest_guide/src/app_assets.dart';
import 'package:elden_ring_quest_guide/src/drawer/my_drawer.dart';
import 'package:elden_ring_quest_guide/src/view/npc_list/npc_list_view_appbar.dart';
import 'package:elden_ring_quest_guide/src/view/npc_list/npn_list_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'npc_details_view.dart';

/// Displays a list of SampleItems.
class NpcListView extends StatefulWidget {
  
  NpcListView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/NpcList';

  final NpcListViewController controller = NpcListViewController();

  bool get isLoading => controller.npcs.isEmpty;

  @override
  State<NpcListView> createState() => _NpcListViewState();
}

class _NpcListViewState extends State<NpcListView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: widget.controller, 
      builder: (context, _) {
        
        return Scaffold(
          appBar: NpcListViewAppbar(
            title: 'NPCs List',
            bgColor: Colors.transparent,
            searchController: widget.controller.textEditingController,
          ),
          drawer: const MyDrawer(currentPage: 'NPCs'),
          // To work with lists that may contain a large number of items, it’s best
          // to use the ListView.builder constructor.
          //
          // In contrast to the default ListView constructor, which requires
          // building all Widgets up front, the ListView.builder constructor lazily
          // builds Widgets as they’re scrolled into view.
          body: ListView(
            // Providing a restorationId allows the ListView to restore the
            // scroll position when a user leaves and returns to the app after it
            // has been killed while running in the background.
            restorationId: 'npcListView',
            children: List.generate(widget.controller.npcs.length, (int index) {
              var npc = widget.controller.npcs[index];
              return ListTile(
                title: Text(npc.name),
                leading: CircleAvatar(
                  // Display the Flutter Logo image asset.
                  foregroundImage: NetworkImage('https://eldenring.wiki.fextralife.com${npc.img}'),
                ),
                onTap: () {
                  // Navigate to the details page. If the user leaves and returns to
                  // the app after it has been killed while running in the
                  // background, the navigation stack is restored.
                  Navigator.restorablePushNamed(
                    context,
                    NpcDetailsView.routeName,
                    arguments: widget.controller.npcs[index].id
                  );
                }
              );
            })
          ),
        );
      }
    );
  }
}
