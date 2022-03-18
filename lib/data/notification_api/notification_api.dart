// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:k_car_care_project/data/base_repository_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/notification_models/notification_model.dart';
import 'package:http/http.dart' as http;
// import 'package:k_car_care_project/model/notification_models/notification_model.dart';

class NotificationApi extends ApiRepository {
  Future<NotificationModel> readNotificationApi() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    http.Response response = await http
        .get(Uri.parse("$url/notificationOwns/"), headers: <String, String>{
      'Content-type': "multipart/form-data",
      'token': token.toString(),
    });
    if (response.statusCode == 200) {
      return NotificationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
