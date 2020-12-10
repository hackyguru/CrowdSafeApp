import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemapscroll/mapscreen/places_model.dart';
import 'polygons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    places.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.name),
          draggable: false,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueAzure,
          ),
          infoWindow: InfoWindow(
              title: element.name,
              snippet: "Crowd : " + element.crowd.toString()),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _placesList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 160.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            // moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    height: 150.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: places[index].crowd > places[index].capacity
                                ? Colors.redAccent.withOpacity(0.9)
                                : Colors.green.withOpacity(0.9)),
                        child: Row(children: [
                          Container(
                              height: 120.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(places[index].thumbNail),
                                      fit: BoxFit.cover))),
                          SizedBox(width: 15.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  places[index].name,
                                  style: TextStyle(
                                      fontSize: 15.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  places[index].area,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Safe capacity : " +
                                      places[index].capacity.toString(),
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    "Crowd :  " +
                                        places[index].crowd.toString(),
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ])
                        ]))))
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            mapToolbarEnabled: true,
            mapType: MapType.hybrid,
            polygons: myPolygon(),
            initialCameraPosition: CameraPosition(
                target: LatLng(10.938030, 76.957107), zoom: 18.0, tilt: 0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25, right: 10),
          child: Align(
              alignment: Alignment.topRight,
              child: Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.all(5)),
                      Text('Status : ',
                          style: TextStyle(
                              fontSize: 15.5, fontWeight: FontWeight.bold)),
                      Icon(Icons.mood),
                      Text('  Safe',
                          style: TextStyle(
                              fontSize: 15.5, fontWeight: FontWeight.bold)),
                    ],
                  ))),
        ),

        // SLIDING PANEL

        SlidingUpPanel(
          panel: Column(
            
            mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 14.0,
            ),
            Text(
              "Crowds Nearby",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            Column(
              children: [
                Container(
                  height: 160.0,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: places.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _placesList(index);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                Icon(Icons.arrow_circle_up,
                color: Colors.white),
                SizedBox(width: 5),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child:
                 Text("Swipe up for detailed statistics",
                style: TextStyle(
                  color: Colors.white,
                ),),)
              ],)
              ],
            ),
            SizedBox(height: 50),
            Text(
              "Statistics",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 30),
          ]),
          minHeight: 230,
          maxHeight: MediaQuery.of(context).size.height,
          backdropEnabled: true,
          color: Colors.black.withOpacity(0.6),
          parallaxEnabled: true,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        ),
      ],
    ));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: places[_pageController.page.toInt()].locationCoords,
        zoom: 18.0,
        bearing: 45.0,
        tilt: 10)));
  }
}
