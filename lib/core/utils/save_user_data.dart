// ignore_for_file: avoid_print, unused_local_variable
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SaveUserData {
  saveUserData({
    String? gmail,
    String? id,
    String? username,
    String? phone,
    String? profileUrl,
    String? createdAt,
    String? lastLoginDate,
    String? token,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _prevList = prefs.getStringList('recents') ?? [] ;
    // ignore: unnecessary_null_comparison
    _prevList.add(jsonEncode({
            "_id":id,
            "gmail": gmail,
            "username": username,
            "profileUrl":profileUrl,
            "phone": phone,
            "createdAt":createdAt,
            "lastLoginDate":lastLoginDate,
            "token":token,
          }
        )
      );  
    prefs
        .setStringList("recents", _prevList)
        .then((value) => print("done Saving to Prefs"));
  }

  saveUserLocation({String? location}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? currentLocation = preferences.getString('userlocation');
    preferences
        .setString(
          'userlocation',
          location.toString(),
        )
        .then((value) => print("done Saving location Prefs"));
  }
}
