import 'package:elden_ring_quest_guide/src/app_assets.dart';
import 'package:elden_ring_quest_guide/src/drawer/my_drawer.dart';
import 'package:elden_ring_quest_guide/src/local_repositories/local_repository.dart';
import 'package:elden_ring_quest_guide/src/model/npc_model.dart';
import 'package:elden_ring_quest_guide/src/view/npc_list/npc_list_view_appbar.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:lottie/lottie.dart';

import 'npc_details_view.dart';

/// Displays a list of SampleItems.
class NpcListView extends StatefulWidget {
  
  NpcListView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/NpcList';

  bool isLoading = false;
  List<NpcModel> npcs = List.empty();

  @override
  State<NpcListView> createState() => _NpcListViewState();
}

class _NpcListViewState extends State<NpcListView> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var repo = Injector.appInstance.get<NpcDataRepo>();

      if(!repo.isInitialized) {
        setState(() {
          widget.isLoading = true;
        });
        await repo.init();
      }

      var all = repo.findAll();
      setState(() {
        widget.isLoading = false;
        widget.npcs = all;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.isLoading) {
      return Center(
        child: Lottie.asset(LottieImages.loading)
      );
    }
    return Scaffold(
      appBar: const NpcListViewAppbar(
        title: 'NPCs List',
        bgColor: Colors.transparent,
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
        children: List.generate(widget.npcs.length, (int index) {
          var npc = widget.npcs[index];
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
                arguments: widget.npcs[index].id
              );
            }
          );
        })
      ),
    );
  }
}
