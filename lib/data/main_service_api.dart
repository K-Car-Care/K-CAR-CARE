// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:k_car_care_project/model/main_services_models/main_model.dart';

import 'base_repository_api.dart';

class MainServiceApi extends ApiRepository {
  Future<MainServiceModel> readMainServiceApi() async {
    http.Response response = await http.get(
      Uri.parse('$url/mainServices/'),
      headers: <String, String>{
        'Content-Type': 'multipart/form-data',
        //  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWUyNDRiMGZlYTYzMjRlZWRkNDgyNjMiLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjQzNDIzNzc3LCJleHAiOjE2NDM2ODI5Nzd9.ILAWBhW3GIs3ETVx8RL4HR5xqei3jU5Xb190K3skvzM"
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return MainServiceModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception((e) {
        print("Error ${e.toString()}");
      });
    }
  }
}
