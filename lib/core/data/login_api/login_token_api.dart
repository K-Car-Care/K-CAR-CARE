// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:k_car_care_project/core/data/base_repository_api.dart';
import 'package:k_car_care_project/core/utils/save_user_data.dart';
import 'package:k_car_care_project/screen/main_home/main_body.dart';

class AccessToken extends ApiRepository {
  final SaveUserData _saveUserData = SaveUserData();
  Future<dynamic> login({
    required String phoneNumber,
    required BuildContext context,
    required String googleId,
    required String displayName,
    required String firstName,
    required String lastName,
    required String email,
    required String profile, 
    required String cloudinary_id,	
    required String status,
  }) async {
    http.Response response = await http
        .post(Uri.parse("$url/auth/login"), 
          body: {
          'phone': phoneNumber,
          'googleId': googleId, 
          'displayName': displayName,
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'profile': profile,
          'cloudinary_id': cloudinary_id,		  
        });
    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 201) {
    }
    if (response.statusCode == 200) {
      print(jsonResponse);
      _saveUserData.saveUserData(
        id:jsonResponse['_id'],
        gmail: jsonResponse['email'],
        username:jsonResponse['displayName'] == ''? jsonResponse['displayName'] : jsonResponse['lastName'] + jsonResponse['firstName'],
        profileUrl: jsonResponse['profile'],
        phone: jsonResponse['phone:'],
        createdAt:jsonResponse['createdAt'],
        lastLoginDate:jsonResponse['lastLoginDate'],
        token:jsonResponse['token'],
      );
      if(status == 'phone'){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MyHomePage()), (Route<dynamic> route) => false);
      }
      return jsonResponse;
    } else {
      throw Exception();
    }
  }
}
