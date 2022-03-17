// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:k_car_care_project/data/base_repository_api.dart';
import 'package:http/http.dart' as http;
import 'package:k_car_care_project/model/notification_models/notification_model.dart';
import 'package:k_car_care_project/storage_data/token_storage/token_storage.dart';
class NotificationApi extends ApiRepository {
  final TokenStorage _token = TokenStorage();
  Future<NotificationModel> readNotificationApi() async {
    var token = _token.gettoken();
    http.Response response = await http
        .get(Uri.parse("$url/notificationOwns/"), headers: <String, String>{
      'Content-type': "multipart/form-data",
      'token': token.toString(),
    });
    if (response.statusCode == 200) {
      print("Notification: ${response.body}");
      return NotificationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
