import 'package:flutter/material.dart';
import 'package:googlemapscroll/introscreen.dart';
import 'package:googlemapscroll/profile/profile.dart';
import 'package:googlemapscroll/qrgenerator/qrgenerator.dart';
import 'mapscreen/mapscreen.dart';
import 'qrgenerator/qrgenerator.dart';

final Map<Widget, Widget> pages = {
  Icon(Icons.home, size: 30): MyHomePage(),
  Icon(Icons.qr_code, size: 30): QRGenerator(),
  Icon(Icons.person, size: 30): Profile(),
};
