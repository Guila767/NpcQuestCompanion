import 'package:flutter/cupertino.dart';

enum ApplicationLoginState { loggedIn, loogedOut, register, undefined }

class ApplicationState extends ChangeNotifier {

    ApplicationLoginState get loginState => _loginState;
    ApplicationLoginState _loginState = ApplicationLoginState.loogedOut;

    void finishSignupFlow() {
      _loginState = ApplicationLoginState.loggedIn;
      notifyListeners();
    }

}