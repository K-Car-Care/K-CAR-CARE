// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_car_care_project/constant/theme_constant.dart';
import 'package:k_car_care_project/model/magazine_notification_model.dart';
import 'package:k_car_care_project/screen/notification_screen/notification_badges.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: ThemeConstant.lightScheme.background,
          appBarTheme: AppBarTheme(
            color: ThemeConstant.lightScheme.background,
          ),
        ),
        debugShowCheckedModeBanner: false,
        //Hello
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FirebaseMessaging _message;
  late int _totalNotificationCounter;
  //model

  PushMagazineNotificationModel? _notificationInfo;

  // Register Notification
  void registerNotification() async {
    _message = FirebaseMessaging.instance;

    //three type of state in notificaiton
    //not determined (null), granted (true) and decline (false)

    NotificationSettings settings = await _message.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted the permission");

      //main message
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushMagazineNotificationModel notification =
            PushMagazineNotificationModel(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
        );
        setState(() {
          _totalNotificationCounter++;
          _notificationInfo = notification;
        });
        if (notification != null) {
          showSimpleNotification(
            Text(
              _notificationInfo!.title.toString(),
            ),
            leading: NotificationBadges(
              totalNotification: _totalNotificationCounter,
            ),
            subtitle: Text(_notificationInfo!.body!),
            background: Colors.cyan.shade700,
            duration: Duration(seconds: 2),
          );
        }
      });
    } else {
      print("permission declined by user");
    }
  }

  @override
  void initState() {
    // Message In background App
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        PushMagazineNotificationModel notification =
            PushMagazineNotificationModel(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['hello'],
        );
        setState(() {
          _totalNotificationCounter++;
          _notificationInfo = notification;
        });
      },
    );

    checkForInitialMessage();
    super.initState();
    registerNotification();
    _totalNotificationCounter = 0;
  }

  // Check the initial message that we receive
  checkForInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      PushMagazineNotificationModel notification =
          PushMagazineNotificationModel(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
        dataTitle: initialMessage.data['title'],
        dataBody: initialMessage.data['body'],
      );
      setState(() {
        _totalNotificationCounter++;
        _notificationInfo = notification;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push Notification Screen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Flutter PushNotification",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          NotificationBadges(
            totalNotification: _totalNotificationCounter,
          ),
          //if notificationInfo is not null
          _notificationInfo != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Title: ${_notificationInfo!.dataTitle ?? _notificationInfo!.title}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Title: ${_notificationInfo!.dataBody ?? _notificationInfo!.body}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      )),
    );
  }
}
