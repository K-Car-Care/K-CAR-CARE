import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:k_car_care_project/core/model/main_services_models/towing_model.dart';

import 'base_repository_api.dart';

class TowingServiceApi extends ApiRepository {
  Future<TowingServiceModel> readTowingService() async {
    http.Response response = await http.get(
      Uri.parse('$url/services?type=towing'),
      headers: <String,String>{
        'Content-type':'maltipart/form-data'
      }
    );
    if (response.statusCode == 200) {
      return TowingServiceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error read data from api");
    }
  }
}
