// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:k_car_care_project/data/base_repository_api.dart';
import 'package:k_car_care_project/storage_data/token_storage/token_storage.dart';

class AccessToken extends ApiRepository {
  final TokenStorage _token = TokenStorage();
  Future<dynamic> accessToken(String phoneNumber) async {
    http.Response response = await http
        .post(Uri.parse("$url/auth/login"), body: {'phone': "+855123456789"});
    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 201) {
      print("success");
    }
    if (response.statusCode == 200) {
      _token.settoken(jsonResponse['token']);

      // print("Success");
    }
    if (response.statusCode == 200) {
      // print("adfjlksdjfl;sadf $jsonResponse");
      return jsonResponse;
    } else {
      throw Exception();
    }
  }
}
