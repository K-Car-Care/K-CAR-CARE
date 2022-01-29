import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:k_car_care_project/model/main_services_models/flate_model.dart';

import 'base_repository_api.dart';

class FlateTireServiceApi extends ApiRepository {
  Future<FlateTireServiceModel> readFlateServiceApi() async {
    http.Response response = await http.get(
      Uri.parse('${url}services?type=flate_tire'),
    );

    if (response.statusCode == 200) {
      return FlateTireServiceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error while reading data from api Flate Tire");
    }
  }
}
