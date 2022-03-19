// ignore_for_file: prefer_const_constructors, empty_catches
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';
import 'package:k_car_care_project/screen/home_screen/1_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String token;
  @override
  initState() {
    token = '';
    checkToken();

    super.initState();
  }

  void checkToken() async {
    try {
      final SharedPreferences _pref = await SharedPreferences.getInstance();
      var token = _pref.getString('token') ?? "";
      if (token != "") {
        Future.delayed(Duration(seconds: 4), () {
          Get.to(() => MyHomeScreen());
        });
      } else {
        Future.delayed(Duration(seconds: 4), () {
          Get.to(RegistrationScreen());
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Splash Screen",
            style: ThemeConstant.textTheme.headline5!.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
