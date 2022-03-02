// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:k_car_care_project/model/map_model/map_model.dart';
import 'package:http/http.dart' as http;

import '../base_repository_api.dart';

class MapApi extends ApiRepository {
  Future<MapModel> readMapApi() async {
    http.Response response =
        await http.get(Uri.parse("$url/garages"), headers: <String, String>{
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWUyNDRiMGZlYTYzMjRlZWRkNDgyNjMiLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjQzNDIzNzc3LCJleHAiOjE2NDM2ODI5Nzd9.ILAWBhW3GIs3ETVx8RL4HR5xqei3jU5Xb190K3skvzM',
    });
    if (response.statusCode == 200) {
      print(response.body);
      return MapModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed map api");
    }
  }
}
