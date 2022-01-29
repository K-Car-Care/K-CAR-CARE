// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';

import 'package:k_car_care_project/screen/notification_screen/detail_notification_screen.dart';
import 'package:k_car_care_project/splash_screen.dart';
import 'package:k_car_care_project/translation_screen/messages.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'auth_services/auth_services.dart';

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
        appBarTheme: AppBarTheme(
          color: ThemeConstant.lightScheme.background,
        ),
      ),
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      // translations will be displayed in that locale
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      home: RegistrationScreen(),
    );
  }
}

class ScreenWrapper extends StatefulWidget {
  const ScreenWrapper({Key? key}) : super(key: key);
  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  static const String onesignalAppId = "1b12b2c6-3f18-4b25-aad5-3a75135485ff";
 
  @override
  void initState() {
    initPlatform();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationScreen();
  }

  Future<void> initPlatform() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId(onesignalAppId);
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {});
    OneSignal.shared.setNotificationOpenedHandler(
      (openedResult) {
        var title = openedResult.notification.title;
        var image = openedResult.notification.bigPicture;
        var date = DateTime.now().toString();
        var desc =
            "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content";
        print("subtitle : ${openedResult.notification.subtitle}");

        Get.to(
          () => DetailNotificationScreen(
            title: title,
            image: image,
            datetime: date,
            desc: desc,
          ),
        );
      },
    );
  }
}
