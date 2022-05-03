import 'package:elden_ring_quest_guide/src/view/settings/settings_view.dart';
import 'package:elden_ring_quest_guide/src/widgets/drawer/my_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  static const String routName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      drawer: const MyDrawer(currentPage: 'Home'),
    );
  }
}