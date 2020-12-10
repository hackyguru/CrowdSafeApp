import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Set<Polygon> myPolygon() {
  List<LatLng> AdminBlock = new List();

  AdminBlock.add(LatLng(10.937984, 76.956072));
  AdminBlock.add(LatLng(10.938000, 76.956268));
  AdminBlock.add(LatLng(10.937841, 76.956382));
  AdminBlock.add(LatLng(10.937783, 76.956593));
  AdminBlock.add(LatLng(10.937583, 76.956591));
  AdminBlock.add(LatLng(10.937570, 76.956251));
  AdminBlock.add(LatLng(10.937696, 76.956095));
  AdminBlock.add(LatLng(10.937984, 76.956072));

  List<LatLng> LibraryBlock = new List();
  LibraryBlock.add(LatLng(10.938450, 76.955830));
  LibraryBlock.add(LatLng(10.938368, 76.955964));
  LibraryBlock.add(LatLng(10.938466, 76.956142));
  LibraryBlock.add(LatLng(10.938494, 76.956248));
  LibraryBlock.add(LatLng(10.938800, 76.956237));
  LibraryBlock.add(LatLng(10.938780, 76.955883));
  LibraryBlock.add(LatLng(10.938671, 76.955864));
  LibraryBlock.add(LatLng(10.938450, 76.955830));

  List<LatLng> MBABlock = new List();
  MBABlock.add(LatLng(10.937727, 76.955932));
  MBABlock.add(LatLng(10.937724, 76.955559));
  MBABlock.add(LatLng(10.937453, 76.955564));
  MBABlock.add(LatLng(10.937432, 76.955984));
  MBABlock.add(LatLng(10.937727, 76.955932));

  Set<Polygon> polygonSet = new Set();
  polygonSet.add(Polygon(
      polygonId: PolygonId('admin'),
      points: AdminBlock,
      strokeColor: Colors.red,
      strokeWidth: 2,
      fillColor: Colors.red.withOpacity(0.5)));

  polygonSet.add(Polygon(
      polygonId: PolygonId('library'),
      points: LibraryBlock,
      strokeColor: Colors.green,
      strokeWidth: 2,
      fillColor: Colors.green.withOpacity(0.5)));

  polygonSet.add(Polygon(
      polygonId: PolygonId('mba'),
      points: MBABlock,
      strokeColor: Colors.red,
      strokeWidth: 2,
      fillColor: Colors.red.withOpacity(0.5)));

  return polygonSet;
}
