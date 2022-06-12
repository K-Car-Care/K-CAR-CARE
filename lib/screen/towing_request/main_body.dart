// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, unnecessary_null_comparison
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:k_car_care_project/core/model/map_model/map_model.dart';
import 'package:k_car_care_project/core/shared/typography.dart';

import '../authenication_screen/registration_screen.dart';

class FindTowingSrvice extends StatefulWidget {
  const FindTowingSrvice({Key? key}) : super(key: key);

  @override
  State<FindTowingSrvice> createState() => _FindTowingSrviceState();
}

class _FindTowingSrviceState extends State<FindTowingSrvice>
    with WidgetsBindingObserver {
  final Completer<GoogleMapController> _controller = Completer();
  MapType _mapType = MapType.normal;
  Position? currentPosition;
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  Future<MapModel>? _mapModel;
  List<Payload>? _listMap;

  @override
  void initState() {
    getGeoLocationPosition();
    setCustomMarker();
    super.initState();
  }

 setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/maps/pin.png");
  }

  createMarker(context) {
    if (customIcon == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration, "assets/maps/pin.png")
          .then(
        (value) {
          setState(() {
            customIcon =
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan);
          });
        },
      );
    }
  }

  final Set<Marker> _markers = {};
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color:Colors.black),
          onPressed: (){Navigator.pop(context);},
        ),
        title: Text(
          "Find the best Place here",
          style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: PopupMenuButton(
              icon: Icon(Icons.more_vert_outlined,color: Colors.black),
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
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
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
        height: 80,
        child: Center(
          child:SubmitButton(
            text: 'Request',
            onPressed: () async {
                //Do Operation Rate App
              },
            ),
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3),
        child: SizedBox(
          height: 120,
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
      ),
    );
  }

  Widget myDetailsContainer1(String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              name,
              style: TextStyle(
                  color: Color(0xff6200ee),
                  fontSize: 28.0,
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
          ),
        ),
        SizedBox(height: 5.0),
        SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: Text(
              "American /u00B7 /u0024/u0024 /u00B7 1.6 mi",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
        SizedBox(height: 5.0),
        SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: Text(
              "Closed /u00B7 Opens 17:00 Thu",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
            )
          ),
      ],
    );
  }

  _googleMap() {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 180,
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
            // firstPlace,
            secondPlace,
            thirdPlace,
            fourPlace,
            fivePlace,
          },
          // markers: _markers,
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(
            "sinat",
          ),
          infoWindow: InfoWindow(
            title: "Hello",
            snippet: "DSKLfjsl;dfkjsadf",
          ),
          icon: mapMarker,
          position: LatLng(11.575895, 104.922046),
        ),
      );
    });
  }


 
  // Marker firstPlace = Marker(
  //   markerId: MarkerId("firstPlace"),
  //   position: LatLng(11.575895, 104.922046),
  //   infoWindow: InfoWindow(
  //     title: "First Place",
  //   ),
  //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
  // );

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
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) {
      print("Get Current Location Success ${value.latitude}, ${value.longitude} ");
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
      title: "Garage 1",
    ),
    icon: BitmapDescriptor.defaultMarker,
  );

  Marker thirdPlace = Marker(
    markerId: MarkerId("thirdPlace"),
    position: LatLng(11.575183, 104.913076),
    infoWindow: InfoWindow(
      title: "Garage 2",
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
      title: "Garage 3",
    ),
    icon: BitmapDescriptor.defaultMarker,
  );

  Marker fivePlace = Marker(
    markerId: MarkerId("fivePlace"),
    position: LatLng(
      11.5506864,
      104.8903678,
    ),
    infoWindow: InfoWindow(
      title: "Garage 5",
    ),
    icon: BitmapDescriptor.defaultMarker,
  );

  
}
