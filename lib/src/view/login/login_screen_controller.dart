import 'package:elden_ring_quest_guide/src/application_state.dart';
import 'package:flutter/material.dart';

class LoginScreenController 
{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApplicationState _applicationState;

  LoginScreenController(this._applicationState);

  void loginCallback() {
    _applicationState.finishSignupFlow();
  }
}