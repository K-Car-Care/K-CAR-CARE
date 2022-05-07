// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:k_car_care_project/core/model/main_services_models/main_model.dart';

import 'base_repository_api.dart';

class MainServiceApi extends ApiRepository {
  Future<MainServiceModel>readMainServiceApi() async {
    http.Response response = await http.get(
      Uri.parse('$url/mainServices'),
      // headers: <String, String>{
      //   "Content-Type": 'multipart/form-data',
      //   "token": "Authorization: Bearer  "
      // },
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjY0ZmFiMzc5MjA4NTdkYWM1ZGRhMjciLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjUxOTE3NDY0fQ.qM0_4f1qog8M4uvTqGWiLqszLfJhu-CQekZXTVNfTvM',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return MainServiceModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception((e) {
        return e;
      });
    }
  }
}
