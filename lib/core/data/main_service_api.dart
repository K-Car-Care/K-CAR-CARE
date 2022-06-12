import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:k_car_care_project/core/model/garage_by_service_model.dart';
import 'package:k_car_care_project/core/model/main_services_models/main_model.dart';
import '../model/service_by_main_sevice_model.dart';
import 'base_repository_api.dart';

class MainServiceApi extends ApiRepository {
  Future<MainServiceModel> readMainServiceApi() async {
    http.Response response = await http.get(
      Uri.parse('$url/mainServices'),
      // headers: <String, String>{
      //   "Content-Type": 'multipart/form-data',
      //   "token": "Authorization: Bearer"
      // },
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjY0ZmFiMzc5MjA4NTdkYWM1ZGRhMjciLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjUxOTE3NDY0fQ.qM0_4f1qog8M4uvTqGWiLqszLfJhu-CQekZXTVNfTvM',
      },
    );
    if (response.statusCode == 200){
      return MainServiceModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception((e) {
        return e;
      });
    }
  }

  Future<ServiceByMainService> readServiceBYMainServiceApi({required String mainId}) async {
    http.Response response = await http.get(
      Uri.parse('$url/mainServices/$mainId/services'),
      // headers: <String, String>{
      //   "Content-Type": 'multipart/form-data',
      //   "token": "Authorization: Bearer  "
      // },
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjY0ZmFiMzc5MjA4NTdkYWM1ZGRhMjciLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjUxOTE3NDY0fQ.qM0_4f1qog8M4uvTqGWiLqszLfJhu-CQekZXTVNfTvM',
      },
    );
    if (response.statusCode == 200) {
      return ServiceByMainService.fromJson(jsonDecode(response.body));
      // return jsonResponse;
      // return GarageByService.fromJson(
      //   jsonDecode(response.body),
      // );
    } else {
      throw Exception((e) {
        return e;
      });
    }
  }


  Future<GarageByService> readGarageBYServiceApi({String? byId}) async {
    http.Response response = await http.get(
      Uri.parse('$url/garage-options?$byId'),
      // headers: <String, String>{
      //   "Content-Type": 'multipart/form-data',
      //   "token": "Authorization: Bearer  "
      // },
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjY0ZmFiMzc5MjA4NTdkYWM1ZGRhMjciLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjUxOTE3NDY0fQ.qM0_4f1qog8M4uvTqGWiLqszLfJhu-CQekZXTVNfTvM',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse  = GarageByService.fromJson(jsonDecode(response.body));
      return jsonResponse;
      // return GarageByService.fromJson(
      //   jsonDecode(response.body),
      // );
    } else {
      throw Exception((e) {
        return e;
      });
    }
  }
}
