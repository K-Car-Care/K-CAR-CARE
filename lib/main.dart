// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/services/notification_service/notification_service.dart';
import 'package:k_car_care_project/splash_screen.dart';
import 'package:k_car_care_project/translation_screen/messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final OnsignalNotificationService _notificationService =
      OnsignalNotificationService();
  @override
  initState() {
    _notificationService.initPlatformState();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFf5f5f5),
        appBarTheme: AppBarTheme(
          color: ThemeConstant.lightScheme.background,
        ),
      ),
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      // translations will be displayed in that locale
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      home: SplashScreen(),
    );
  }
}
