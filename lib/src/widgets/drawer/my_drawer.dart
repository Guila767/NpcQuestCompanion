import 'package:elden_ring_quest_guide/src/app_assets.dart';
import 'package:elden_ring_quest_guide/src/app_colors.dart';
import 'package:elden_ring_quest_guide/src/view/home/home.dart';
import 'package:elden_ring_quest_guide/src/view/npc_list/npc_list_view.dart';
import 'package:elden_ring_quest_guide/src/widgets/elden_ring_themed/elden_ring_box_border.dart';
import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  final String currentPage;

  const MyDrawer({required this.currentPage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          border: EldenRingBoxBorder(),
          borderRadius: const BorderRadius.all(Radius.circular(3))
        ),
        //color: AppColors.blue800,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.85,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AppImages.placeHolder )
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: IconButton(
                            icon: const Icon(Icons.close,
                              color: AppColors.white, size: 24.0),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(
                padding: const EdgeInsets.only(top: 36, left: 8, right: 16),
                children: [
                  DrawerTile(
                    title: 'Home',
                    icon: Icons.house,
                    onTap: () {
                      if (currentPage != 'home') {
                        Navigator.pushReplacementNamed(context, Home.routName);
                      }
                    },
                    isSelected: currentPage == 'Home',
                  ),
                  DrawerTile(
                    title: 'NPCs',
                    icon: Icons.people,
                    onTap: () {
                      if (currentPage != 'NPCs') {
                        Navigator.pushReplacementNamed(context, NpcListView.routeName);
                      }
                    },
                    isSelected: currentPage == 'NPCs',
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }
}
