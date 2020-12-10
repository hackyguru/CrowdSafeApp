import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:googlemapscroll/introscreen.dart';
import 'package:googlemapscroll/splashscreen.dart';
import 'routes.dart';

void main() => runApp(AppLaunch());


class AppLaunch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrowdSafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final PageController _pageController = PageController();
  int _index;

  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  Future<bool> _onWillPop() {
    if (_pageController.page.round() == _pageController.initialPage)
      return Future.value(true);
    else {
      //Comment this and uncomment the below commented lines if you need to go back to the previousPage.
      _pageController.jumpToPage(0);
      /*
      _pageController.previousPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: 
      Stack(
        children: <Widget> [      
      
      Scaffold(
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: pages.values.toList(),
            onPageChanged: (int index) {
              setState(() {
                _index = index;
                _pageController.jumpToPage(index);
              });
            }),
        bottomNavigationBar: CurvedNavigationBar(
          height: 50.0,
          index: _index,
          items: pages.keys.toList(),
          color: Colors.white.withOpacity(0.6),
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.black.withOpacity(0.6),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int index) {
            setState(() {
              _index = index;
              _pageController.jumpToPage(index);
            });
          },
        ),
      ),
      ]
    ),
    );
  }
}
