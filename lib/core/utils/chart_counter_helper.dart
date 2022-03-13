import 'package:get/get.dart';

class CounterHelper extends GetxController {
  var counter = 0.obs;

  changeCounter() {
    counter.value++;
  }
}
