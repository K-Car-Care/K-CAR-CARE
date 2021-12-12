// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ThemeConstant.lightScheme.background,
        appBarTheme: AppBarTheme(color: ThemeConstant.lightScheme.background),
      ),
      debugShowCheckedModeBanner: false,
      //Hello
      home: const MyHomeScreen(),
    );
  }
}
