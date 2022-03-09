import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:k_car_care_project/data/base_repository_api.dart';

class AccessToken extends ApiRepository {
  Future<dynamic> accessToken(String phoneNumber) async {
    http.Response response = await http
        .post(Uri.parse("$url/auth/login"), body: {'phone': "+85512345678"});
    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 201) {
      print("Success");
    }
    if (response.statusCode == 200) {
      print("adfjlksdjfl;sadf $jsonResponse");
    } else {
      throw Exception();
    }
  }
}
