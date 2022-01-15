// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? newGoogleMapController;
  MapType _mapType = MapType.normal;
  Position? currentPosition;
  var geoLocator = Geolocator();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Find Place",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {
                    setState(() {
                      _mapType = MapType.hybrid;
                    });
                    print("Hybrid");
                  },
                  child: Text("Hybrid"),
                ),
                PopupMenuItem(
                  onTap: () {
                    setState(() {
                      _mapType = MapType.normal;
                    });
                    print("Normal map");
                  },
                  child: Text("normal"),
                  value: 2,
                )
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          _googleMap(),
          _buildContainer(),
        ],
      ),
    );
  }

  _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 125,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _boxes(
                  "https://i.pinimg.com/550x/48/a1/43/48a1431a8a4345575d3dce035d4452d9.jpg",
                  11.575895,
                  104.922046,
                  "Garage"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _boxes(
                  "https://i.pinimg.com/550x/48/a1/43/48a1431a8a4345575d3dce035d4452d9.jpg",
                  11.575454,
                  104.920095,
                  "Garage"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _boxes(
                  "https://i.pinimg.com/550x/48/a1/43/48a1431a8a4345575d3dce035d4452d9.jpg",
                  11.575183,
                  104.913076,
                  "Garage"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _boxes(
                  "https://i.pinimg.com/550x/48/a1/43/48a1431a8a4345575d3dce035d4452d9.jpg",
                  11.563219,
                  104.883367,
                  "Garage"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double lon) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lon),
          zoom: 15,
          tilt: 50.0,
          bearing: 45.0,
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double lon, String title) {
    return InkWell(
      onTap: () {
        _gotoLocation(lat, lon);
      },
      child: Container(
        child: FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(6),
            shadowColor: Color(0x802196f3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image.network(
                      _image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: myDetailsContainer1(title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "4.1",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star_half,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  _googleMap() {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        print("object");
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 200,
        child: GoogleMap(
          compassEnabled: true,
          myLocationButtonEnabled: true,
          mapType: _mapType,
          initialCameraPosition: CameraPosition(target: LatLng(0, 0),),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            firstPlace,
            secondPlace,
            thirdPlace,
            fourPlace,
          },
        ),
      ),
    );
  }

  Marker firstPlace = Marker(
    markerId: MarkerId("firstPlace"),
    position: LatLng(11.575895, 104.922046),
    infoWindow: InfoWindow(
      title: "First Place",
    ),
    icon: BitmapDescriptor.defaultMarker,
  );

  Marker secondPlace = Marker(
    markerId: MarkerId("secondPlace"),
    position: LatLng(11.575454, 104.920095),
    infoWindow: InfoWindow(
      title: "Second Place",
    ),
    icon: BitmapDescriptor.defaultMarker,
  );

  Marker thirdPlace = Marker(
    markerId: MarkerId("thirdPlace"),
    position: LatLng(11.575183, 104.913076),
    infoWindow: InfoWindow(
      title: "Third Place",
    ),
    icon: BitmapDescriptor.defaultMarker,
  );

  Marker fourPlace = Marker(
    markerId: MarkerId("fourPlace"),
    position: LatLng(
      11.563219,
      104.883367,
    ),
    infoWindow: InfoWindow(
      title: "Third Place",
    ),
    icon: BitmapDescriptor.defaultMarker,
  );

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}
