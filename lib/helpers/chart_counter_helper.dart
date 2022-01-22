import 'package:get/get.dart';

class CounterHelper extends GetxController {
  int? counter;

  void changeCounter() {
    counter = 4;
    update();
  }
}
