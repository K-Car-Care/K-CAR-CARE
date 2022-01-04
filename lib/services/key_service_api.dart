import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:k_car_care_project/model/main_services_models.dart/key_service_model.dart';

import 'base_repository_api.dart';

class KeyServiceApi extends ApiRepository {
  Future<KeyServiceModel> readKeyService() async {
    http.Response response =
        await http.get(Uri.parse('${url}services?type=key_service'));

    if (response.statusCode == 200) {
      return KeyServiceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error read data Key Service");
    }
  }
}
