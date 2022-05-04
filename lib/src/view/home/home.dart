import 'package:elden_ring_quest_guide/src/view/home/home_completed_quests.dart';
import 'package:elden_ring_quest_guide/src/view/home/home_quests.dart';
import 'package:elden_ring_quest_guide/src/view/settings/settings_view.dart';
import 'package:elden_ring_quest_guide/src/widgets/drawer/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  static const String routName = '/home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.dragon)),
              Tab(icon: Icon(FontAwesomeIcons.shieldCat)),
            ],
          ),
        ),
        drawer: const MyDrawer(currentPage: 'Home'),
        body: TabBarView(
          children: [
            OnGoingQuest(),
            const CompletedQuests()
          ],
        )
      ),
    );
  }
}