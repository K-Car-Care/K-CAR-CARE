// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/authenication_screen/registration_screen.dart';
import 'package:k_car_care_project/screen/home_screen/home_screen.dart';
import 'package:k_car_care_project/translation_example_screen/messages.dart';
import 'package:k_car_care_project/translation_example_screen/translation_veiw.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

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
      locale: const Locale('en','US'),
      fallbackLocale: const Locale('en','US'),
      home: MessageView(),
    );
  }
}

class ScreenWrapper extends StatefulWidget {
  const ScreenWrapper({Key? key}) : super(key: key);

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  static const String onesignalAppId = "3b2417ee-ec74-4dac-9d04-b83a9c71cf2d";

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
      // print("Accepted permission: $accepted");
    });
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {});
    OneSignal.shared.setNotificationOpenedHandler((openedResult) {
      var data = openedResult.notification.title;
      print(data);
      Get.to(() => MyHomeScreen());
    });
  }
}
