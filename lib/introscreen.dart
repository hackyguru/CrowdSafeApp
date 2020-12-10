import 'package:flutter/material.dart';
import 'package:googlemapscroll/auth/login_page.dart';
import 'package:googlemapscroll/main.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';
import 'package:sk_onboarding_screen/flutter_onboarding.dart';


class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IntroState();
  }
}

class IntroState extends State<Intro> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _globalKey,
      body: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: Colors.red,
        pages: pages,
        skipClicked: (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
        },
        getStartedClicked: (value) {
           Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
        },
      ),
    );
  }

  final pages = [
    SkOnboardingModel(
        title: 'Stay away from crowds',
        description:
            'Make sure you stay in areas marked with green color to stay safe from the crowds',
        titleColor: Colors.red,
        descripColor: Colors.black.withOpacity(0.8),
        imagePath: 'assets/onboarding1.png'),
    SkOnboardingModel(
        title: 'Contactless visitor logs',
        description:
            'No more physical visitor logs. Use your QR code to checkin various places safely',
        titleColor: Colors.red,
        descripColor: Colors.black.withOpacity(0.8),
        imagePath: 'assets/onboarding2.png'),
    SkOnboardingModel(
        title: 'Allow permissions',
        description: 'Please grant us access to your location and storage for using the app',
        titleColor: Colors.red,
        descripColor: Colors.black.withOpacity(0.8),
        imagePath: 'assets/onboarding3.png'),
  ];
}