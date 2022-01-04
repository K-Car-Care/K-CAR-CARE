// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindingRepairGarageScreen extends StatefulWidget {
  const FindingRepairGarageScreen({Key? key}) : super(key: key);

  @override
  _FindingRepairGarageScreenState createState() =>
      _FindingRepairGarageScreenState();
}
  
class _FindingRepairGarageScreenState extends State<FindingRepairGarageScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(11.562108, 104.888535),
    zoom: 10,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(11.552426,104.8793192),
      tilt: 59.440717697143555,
      zoom: 20);

  @override
  void initState() {
    super.initState();
    initilize();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initilize() {
    Marker first = Marker(
      markerId: MarkerId("first"),
      position: LatLng(11.552727,104.880601),
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
      position: LatLng(11.5523974,104.8785865),
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
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers.map((e) => e).toSet(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To Phnom Penh'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
