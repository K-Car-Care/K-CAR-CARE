// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';
// import 'package:k_car_care_project/screen/home_screen/home_screen.dart';
// import 'package:k_car_care_project/screen/translate_screen/translation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    Timer(
      Duration(
        seconds: 5,
      ),
      () {
        Get.to(RegistrationScreen());
      },
    );
    super.initState();
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
