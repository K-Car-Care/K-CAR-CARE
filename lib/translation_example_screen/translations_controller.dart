import 'dart:ui';

import 'package:get/get.dart';

class MessageController extends GetxController {
  void changeLaguage(String languageCode, String countryCode) {
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
  }
}
