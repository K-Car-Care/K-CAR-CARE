import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:k_car_care_project/core/model/main_services_models/towing_model.dart';
import '../model/towing_company.dart';
import 'base_repository_api.dart';

class TowingServiceApi extends ApiRepository {
  Future<TowingServiceModel> readTowingService() async {
    http.Response response = await http.get(
      Uri.parse('$url/services'),
      // headers: <String,String>{
      //   'Content-type':'maltipart/form-data'
      // }
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjg4NWYxMjQ2ZTNiMWVhMWFhOWNkMzAiLCJpc0FkbWluIjp0cnVlLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE2NTM3OTMwNDJ9.ATRe1mAh6Gy12d82E_Otmd0RRbdHx6WUcDRyxHyjajU',
      },
    );
    if (response.statusCode == 200) {
      return TowingServiceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error read data from api");
    }
  }


  Future<TowingCompanyModel> readTowingCompany() async {
    http.Response response = await http.get(
      Uri.parse('$url/towing-company'),
      // headers: <String,String>{
      //   'Content-type':'maltipart/form-data'
      // }
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjg4NWYxMjQ2ZTNiMWVhMWFhOWNkMzAiLCJpc0FkbWluIjp0cnVlLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE2NTM3OTMwNDJ9.ATRe1mAh6Gy12d82E_Otmd0RRbdHx6WUcDRyxHyjajU',
      },
    );
    if (response.statusCode == 200) {
      return TowingCompanyModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception((e) {
        return e;
      });
    }
  }

}
