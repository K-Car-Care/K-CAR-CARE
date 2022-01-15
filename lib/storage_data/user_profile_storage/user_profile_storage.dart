import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StoreCarInformation {
  void carstorageInfo(
      {String? year,
      String? make,
      String? model,
      String? color,
      String? cartype}) async {
    SharedPreferences _carPref = await SharedPreferences.getInstance();
    List<String> _carList = _carPref.getStringList('carStore') ?? [];
    _carPref.remove('carStore');
    _carList.add(
      jsonEncode({
        'year': year ?? 00,
        'make': make ?? 00,
        'model': model ?? "empty",
        'color': color ?? "empty",
        'carType': cartype ?? "empty",
      }),
    );

    _carPref.setStringList('carStore', _carList);
   
    print("done Saving to Pref");
  }
}
