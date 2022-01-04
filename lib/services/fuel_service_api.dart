import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:k_car_care_project/model/main_services_models.dart/fuel_model.dart';

import 'base_repository_api.dart';

class FuelServiceApi extends ApiRepository {
  Future<FuelService> readFuelService() async {
    http.Response response = await http.get(
      Uri.parse("${url}services?type=fuel"),
    );
    if (response.statusCode == 200) {
      return FuelService.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error read fuel service");
    }
  }
}
