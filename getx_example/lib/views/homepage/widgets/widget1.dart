import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_example/controller/counter_controller.dart';

class Widget1 extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              "Counter is: ",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: counterController.decrement,
                    icon: Icon(Icons.remove)),
                Obx(
                  () => Text(
                    "${counterController.counter.value}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: counterController.increment,
                    icon: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
