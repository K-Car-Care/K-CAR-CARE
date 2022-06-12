// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:k_car_care_project/core/model/map_model/map_model.dart';
import 'package:http/http.dart' as http;
import '../base_repository_api.dart';

class MapApi extends ApiRepository {
  Future<MapModel> readMapApi() async {
    http.Response response =
        await http.get(Uri.parse("$url/garages"), 
        headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjY0ZmFiMzc5MjA4NTdkYWM1ZGRhMjciLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjUxOTE3NDY0fQ.qM0_4f1qog8M4uvTqGWiLqszLfJhu-CQekZXTVNfTvM',
      },
        );
    if (response.statusCode == 200) {
      // print(response.body);
      return MapModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed map api");
    }
  }
}
