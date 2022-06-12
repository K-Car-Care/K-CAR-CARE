import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/services/notification_service/notification_service.dart';
import 'package:k_car_care_project/translation_screen/messages.dart';
import 'package:provider/provider.dart';
import 'core/provider/state_change_notifier.dart';
import 'core/services/custom_painer_easyloading.dart';
import 'screen/main_home/main_body.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configLoading();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<StateChangeNotifier>(
          create: (context) => StateChangeNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = defaultColor
    ..backgroundColor = Colors.green
    ..indicatorColor = defaultColor
    ..textColor = defaultColor
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final OnsignalNotificationService _notificationService = OnsignalNotificationService();

  @override
  initState() {
    _notificationService.initPlatformState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Quicksand",
        scaffoldBackgroundColor: const Color(0xFFf5f5f5),
        appBarTheme: AppBarTheme(
          color: ThemeConstant.lightScheme.background,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:  Brightness.dark,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: const Locale('en','US'),
      fallbackLocale: const Locale('en','US'),
      home: const MyHomePage(),
      builder: EasyLoading.init(),
    );
  }
}