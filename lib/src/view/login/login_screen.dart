import 'dart:ui';

import 'package:elden_ring_quest_guide/src/app_assets.dart';
import 'package:elden_ring_quest_guide/src/view/login/login_screen_controller.dart';
import 'package:elden_ring_quest_guide/src/widgets/inputbar/inputbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_screen_controller.dart';

class LoginScreen extends StatefulWidget {
  
  final LoginScreenController loginScreenController;

  const LoginScreen({Key? key, required this.loginScreenController}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  
  late AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 3), 
    vsync: this 
  );
  Animation<double>? _fadeInAnim;

  @override
  void initState() {
    super.initState();
    _fadeInAnim = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 1, milliseconds: 000));
      animationController.forward();
    });
  }
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold (
    extendBodyBehindAppBar: true,
    body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.art3), fit: BoxFit.cover)),
        ),
        SafeArea(
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.1 , left: 16.0, right: 16.0, bottom: 32),
              child: Card(
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: FadeTransition(
                  opacity: _fadeInAnim!,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      color: Colors.black.withAlpha(100),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 24.0, bottom: 8),
                                child: Center(
                                    child: Text("Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600))),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                    onPressed: () {},
                                    elevation: 4.0,
                                    fillColor: Theme.of(context).primaryColor,
                                    child: const Icon(
                                      FontAwesomeIcons.google,
                                      size: 16.0,
                                    ),
                                    padding: const EdgeInsets.all(15.0),
                                    shape: const CircleBorder(),
                                  ),
                                  RawMaterialButton(
                                    onPressed: () {},
                                    elevation: 4.0,
                                    fillColor: Theme.of(context).primaryColor,
                                    child: const Icon(
                                      FontAwesomeIcons.twitter,
                                      size: 16.0,
                                    ),
                                    padding: const EdgeInsets.all(15.0),
                                    shape: const CircleBorder(),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.0, bottom: 18.0),
                                child: Center(
                                  child: Text("or with e-mail",
                                      style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 16)),
                                ),
                              ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Inputbar(
                                      placeholder: "Email address...",
                                      prefixIcon:
                                          Icon(Icons.mail, size: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0,
                                        left: 8.0,
                                        right: 8.0,
                                        bottom: 0),
                                    child: Inputbar(
                                        placeholder: "Password...",
                                        prefixIcon:
                                            Icon(Icons.lock, size: 20)),
                                  ),
                                ],
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () => widget.loginScreenController.loginCallback(),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      18.0)))),
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 32.0,
                                          right: 32.0,
                                          top: 12,
                                          bottom: 12),
                                      child: Text("Login",
                                          style:
                                              TextStyle(fontSize: 14.0))),
                                ),
                              ),
                            ],
                          ),
                        ),
                    )
                                ),
                  ),
                )),
            ),
          ]),
        )
      ],
    ));
  }
}
