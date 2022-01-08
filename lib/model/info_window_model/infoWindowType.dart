import 'package:google_maps_flutter/google_maps_flutter.dart';

enum InfoWindowType { position, desination }

class CarInfoWindow {
  final String? name;
  final Duration? time;
  final LatLng? position;
  final InfoWindowType type;

  CarInfoWindow({this.name, this.time, this.position,required  this.type});
}
