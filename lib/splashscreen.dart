import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:googlemapscroll/introscreen.dart';
import 'package:googlemapscroll/main.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Crowd Safe',
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: 'assets/splash-logo.png',
          splashIconSize: 400,
          nextScreen: Intro(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.grey[900]
        )
    );
  }
}
