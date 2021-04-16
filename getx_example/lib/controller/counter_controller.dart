import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter.value++;
    update(); // look here!
  }

  void decrement() {
    counter.value--;
    update(); // look here!
  }
}
