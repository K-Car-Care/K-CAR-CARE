import 'package:get/get.dart';
// import 'package:k_car_care_project/screen/history_screen.dart/main_history_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../screen/notification_screen/detail_notification_screen.dart';

class OnsignalNotificationService {
  static const String setAppID = "711e896c-e13a-4dad-82c6-40fe033c8939";
  Future<void> initPlatformState() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId(setAppID);
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      // print("Accepted permission: $accepted");
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {});

    OneSignal.shared.setNotificationOpenedHandler(
      (openedResult) {
        var title = openedResult.notification.title;
      //  var subtitle = openedResult.notification.additionalData?["feedback_id"];
      //   print("titleasdfasdfadfadfsd:$title");
        Get.to(
          () => DetailNotificationScreen(
            title: title.toString(),
            desc: "SInat",
            datetime: "aldksfj",
          ),
        );
      },
    );
  }
}
