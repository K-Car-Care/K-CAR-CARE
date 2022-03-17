// ignore_for_file: avoid_print
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  void settoken(String token) async {
    try {
      final SharedPreferences _pref = await SharedPreferences.getInstance();
      await _pref.setString("token", token).then((value) {
        print("Token save to pref successfully");
      });
    } catch (e) {
      print("Token save to pref Fail");
    }
  }

  gettoken() async {
    try {
      final SharedPreferences _pref = await SharedPreferences.getInstance();
      var token = _pref.getString("token");
      print(token.toString());
      return token.toString();
    } catch (e) {
      print("get token error");
    }
  }
}
