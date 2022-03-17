import 'dart:convert';

import 'package:k_car_care_project/data/base_repository_api.dart';
import 'package:http/http.dart' as http;
import 'package:k_car_care_project/model/car_relevent_news_models/car_relevent_news_model.dart';

class CarReleventNewsApi extends ApiRepository {
  Future<CarReleventNewsModel> readCarReleventNewsApi() async {
    http.Response response = await http
        .get(Uri.parse("$url/notificationOwns/"), headers: <String, String>{
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWUyNDRiMGZlYTYzMjRlZWRkNDgyNjMiLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjQ2MzgwNjA2fQ.TlvTDNhy2rnl2kwEdosAwLBSdfs_zAncYCfNUxUXMY0',
    });
    if (response.statusCode == 200) {

      // ignore: avoid_print
      print(response.body);

      return CarReleventNewsModel.fromJson(
        jsonDecode(
          response.body,
        ),
      );
    } else {
      throw Exception();
    }
  }
}
