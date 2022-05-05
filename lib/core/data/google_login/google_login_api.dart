import 'dart:convert';
import 'package:k_car_care_project/core/model/google_login_models/goole_login_model.dart';
import 'package:http/http.dart' as http;
import '../base_repository_api.dart';

class GoogleLogin extends ApiRepository {
  Future<GoogleLoginModel> googlelogin(
      {required String displayName,
      required String firstName,
      required String lastName,
      required String email,
      required String phone}) async {
    http.Response response = await http.post(
      Uri.parse('$url/auth/login'),
      headers: <String, String>{'Content-Type': "multipart/form-data"},
      body: jsonEncode(
        <String, String>{
          'displayName':displayName,
        },
      ),
    );
    if (response.statusCode == 201) {
      return GoogleLoginModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Failed to login ");
    }
  }
}
