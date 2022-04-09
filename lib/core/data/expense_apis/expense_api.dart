// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:k_car_care_project/core/model/expense_models/expense_model.dart';
import 'package:http/http.dart' as http;

import '../base_repository_api.dart';

class ExpenseApi extends ApiRepository {
  Future<ExpenseModel> readListExpenseApi() async {
    http.Response response = await http.get(
      Uri.parse(
        "http://k-car-care.herokuapp.com/api/v1/usedServices/",
      ),
      headers: {
        "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWUyNDRiMGZlYTYzMjRlZWRkNDgyNjMiLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjQyOTAzMTcyLCJleHAiOjE2NDMxNjIzNzJ9.ROz-jsfxtdC7DdHYRrSXgbrpvdQtFGS0aFCbEHDHODA",
      },
    );
    var responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(responseJson['payload']);
      return ExpenseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error while reading data from api Flate Tire");
    }
  }
}
