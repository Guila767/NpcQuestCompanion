import 'package:elden_ring_quest_guide/src/application_state.dart';
import 'package:elden_ring_quest_guide/src/local_repositories/local_repository.dart';
import 'package:elden_ring_quest_guide/src/view/settings/settings_controller.dart';
import 'package:elden_ring_quest_guide/src/view/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  var injector = Injector.appInstance;
  initilizeInjector(injector);

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(ChangeNotifierProvider(
    create: (ctx) => ApplicationState(),
    builder: (ctx, _)  => MyApp(settingsController: settingsController)
  ));
}

void initilizeInjector(Injector injector) {
  injector.registerSingleton<NpcDataRepo>(() {
    var repo = NpcDataRepo();
    return repo;
  });
}
