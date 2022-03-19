// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class PhonenumberStorage {
  void phoneStorage(String phoneNum) async {
    try {
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString("phoneNumber", phoneNum).then((value) {
        print("Phone Number store successfull");
      });
    } catch (e) {
      print("Phone Number store Failed");
    }
  }
}
