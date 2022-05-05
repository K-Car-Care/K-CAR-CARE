// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SaveUserData {
  saveUserData({
    String? gmail,
    String? profileUrl,
    String? username,
    String? phone,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _prevList = prefs.getStringList('recents') ?? [];
    // ignore: unnecessary_null_comparison
    gmail != null && profileUrl != null
        ? _prevList.add(jsonEncode({
            "gmail": gmail,
            "profile": profileUrl,
            "userName": username,
            "phoneNumber": phone,
          }))
        : () {};
    prefs
        .setStringList("recents", _prevList)
        .then((value) => print("done Saving to Prefs"));
  }

  saveUserLocation({String? location}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? currentLocation = preferences.getString('userlocation');
    print(location);
    preferences
        .setString(
          'userlocation',
          location.toString(),
        )
        .then((value) => print("done Saving location Prefs"));
  }
}
