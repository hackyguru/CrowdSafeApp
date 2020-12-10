import 'package:google_maps_flutter/google_maps_flutter.dart';

class Places {
  String name;
  String area;
  String description;
  String thumbNail;
  int crowd;
  int capacity;
  LatLng locationCoords;

  Places(
      {this.name,
      this.area,
      this.description,
      this.thumbNail,
      this.crowd,
      this.capacity,
      this.locationCoords});
}

final List<Places> places = [
  Places(
      name: 'Library',
      area: 'Area : 55,000sqft',
      description:
          'One of the largest libraries in an Indian educational institution with a state of art infrastructure and well maintained.',
      locationCoords: LatLng(10.938548, 76.955901),
      crowd: 31,
      capacity: 30,
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'
      ),
  Places(
      name: 'MBA Block',
      area: '463 7th Ave',
      description:
          'MBA Block is for the students pursuing PG.',
      crowd: 74,
      capacity: 30,
      locationCoords: LatLng(10.937500,76.955767),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'
      ),
];

