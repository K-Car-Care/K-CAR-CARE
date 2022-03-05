// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'base_repository_api.dart';

class UserProfileApi extends ApiRepository {
  Future readTowingService() async {
    http.Response response = await http.get(
      Uri.parse('$url/users'),
    );
    var responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(responseJson.toString());
      return responseJson;
    } else {
      throw Exception("Error read data from api");
    }
  }
}
