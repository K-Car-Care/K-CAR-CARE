// ignore_for_file: avoid_print

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetUserLocation {
  Future getCurrentLocation({
    Position? position,
    List<Placemark>? placemark,
    String? locationController,
  }) async {
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    position = newPosition;
    placemark = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    Placemark pMark = placemark[0];

    String completeAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality},${pMark.subAdministrativeArea},${pMark.administrativeArea}, ${pMark.postalCode} ${pMark.country}';
    locationController = completeAddress;
    print(locationController);
  }
}
