import 'package:elden_ring_quest_guide/src/application_state.dart';
import 'package:elden_ring_quest_guide/src/view/home/home.dart';
import 'package:elden_ring_quest_guide/src/view/login/login_screen.dart';
import 'package:elden_ring_quest_guide/src/view/login/login_screen_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Router extends StatelessWidget {
  const Router({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Consumer<ApplicationState>(builder: (context, appState, __) {
      switch (appState.loginState) {
        case ApplicationLoginState.loggedIn:
          return const Home();
        case ApplicationLoginState.loogedOut:
          return LoginScreen(loginScreenController: LoginScreenController(appState));
        default:
          return const Home();
      }
    });     
  }
}