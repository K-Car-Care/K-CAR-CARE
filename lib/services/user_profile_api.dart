import 'dart:convert';

import 'package:http/http.dart' as http;
import 'base_repository_api.dart';

class UserProfileApi extends ApiRepository {
  Future readTowingService() async {
    http.Response response = await http.get(
      Uri.parse('https://k-car-care.herokuapp.com/api/v1/users'),
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
