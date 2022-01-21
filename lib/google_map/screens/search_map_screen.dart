// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'dart:async';
import 'dart:typed_data';

import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen>
    with WidgetsBindingObserver {
  final Completer<GoogleMapController> _controller = Completer();
  MapType _mapType = MapType.normal;
  Position? currentPosition;
  BitmapDescriptor? customIcon;

  @override
  void initState() {
    getGeoLocationPosition();
    super.initState();
  }

  createMarker(context) {
    if (customIcon == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration, "assets/maps/pin.png")
          .then(
        (value) {
          setState(() {
            customIcon = value;
          });
        },
      );
    }
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
      body: currentPosition == null
          ? Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgressIndicator())),
            )
          : Stack(
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
                "Garage",
              ),
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
      onTap: () async {
        _gotoLocation(lat, lon);
        // currentPosition = await getGeoLocationPosition();
        // await getAddressFromLatLong(currentPosition!);
        print(currentPosition?.latitude.toString());
        print(currentPosition?.longitude.toString());
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
            ),
          ),
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
          "American /u00B7 /u0024/u0024 /u00B7 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed /u00B7 Opens 17:00 Thu",
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
          myLocationEnabled: true,
          
          mapType: _mapType,
          initialCameraPosition: CameraPosition(
            target: currentPosition == null
                ? LatLng(11.5793306, 104.7500993)
                : LatLng(currentPosition!.latitude, currentPosition!.longitude),
            zoom: currentPosition == null ? 10.0 : 12.0,
          ),
          onMapCreated: _onMapCreated,
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

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Marker firstPlace = Marker(
    markerId: MarkerId("firstPlace"),
    position: LatLng(11.575895, 104.922046),
    infoWindow: InfoWindow(
      title: "First Place",
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
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
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      print(
          "Get Current Location Success ${value.latitude}, ${value.longitude} ");
      setState(() {
        currentPosition = value;
        print("go");
      });

      return value;
    });
    return position;
  }

  Marker secondPlace = Marker(
    markerId: MarkerId("secondPlace"),
    position: LatLng(11.575454, 104.920095),
    infoWindow: InfoWindow(
      title: "Second Place",
    ),
    // icon: BitmapDescriptor.defaultMarkerWithHue(hue),
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

  // Future<void> getAddressFromLatLong(Position position) async {
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   print(placemarks);
  //   Placemark place = placemarks[0];

  //   Address =
  //       '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  //   setState(
  //     () {
  //       print(Address.toString());
  //     },
  //   );
  // }

}
