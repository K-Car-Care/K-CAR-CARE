// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/data/check_connectivity/check_connectivity.dart';

class FindingRepairGarageScreen extends StatefulWidget {
  const FindingRepairGarageScreen({Key? key}) : super(key: key);

  @override
  _FindingRepairGarageScreenState createState() =>
      _FindingRepairGarageScreenState();
}

class _FindingRepairGarageScreenState extends State<FindingRepairGarageScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> marker = {};
  List<Marker> markers = [];
  LatLng? currentLocation;

  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
      marker.add(
        Marker(
          markerId: MarkerId('12'),
          position: currentLocation!,
          infoWindow: InfoWindow(title: "Your Current Location"),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initilize();
    CheckInternet().checkConnection(context);
    getCurrentLocation();
  }

  @override
  void dispose() {
    CheckInternet().listener?.cancel();
    super.dispose();
  }

  initilize() {
    Marker first = Marker(
      markerId: MarkerId("first"),
      position: LatLng(11.552727, 104.880601),
      infoWindow: InfoWindow(
        title: "Title",
        snippet: "Hello",
      ),
      icon: BitmapDescriptor.defaultMarker,
    );
    Marker second = Marker(
      markerId: MarkerId("second"),
      position: LatLng(11.5531702, 104.8791566),
      infoWindow: InfoWindow(
        title: "Title",
        snippet: "Hello",
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    Marker third = Marker(
      markerId: MarkerId("third"),
      position: LatLng(11.5523974, 104.8785865),
      infoWindow: InfoWindow(
        title: "Title",
        snippet: "Hello",
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    Marker fourth = Marker(
      markerId: MarkerId("fourth"),
      position: LatLng(11.5522942, 104.87923),
      infoWindow: InfoWindow(
        title: "Title",
        snippet: "Hello",
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    markers.add(first);
    markers.add(second);
    markers.add(third);
    markers.add(fourth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: currentLocation != null
            ? GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: currentLocation!,
                  zoom: 15,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: marker,
              )
            : SizedBox.shrink(),
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
