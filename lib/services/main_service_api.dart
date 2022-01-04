// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:k_car_care_project/model/main_services_models.dart/main_model.dart';

import 'base_repository_api.dart';

class MainServiceApi extends ApiRepository {
  Future<MainServiceModel> readMainServiceApi() async {
    http.Response response = await http.get(
      Uri.parse('${url}mainServices'),
    );
    if (response.statusCode == 200) {
      return MainServiceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception((e) {
        print("Error ${e.toString()}");
      });
    }
  }
}
