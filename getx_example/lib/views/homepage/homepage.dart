import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/views/homepage/widgets/widget1.dart';
import 'package:getx_example/views/homepage/widgets/widget2.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Demo"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Widget1(),
              Widget2(),
              TextButton(
                onPressed: () {
                  print("myLog: Button pressed!");
                  Get.snackbar(
                    'GetX Snackbar',
                    'Yay! Awesome GetX Snackbar',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: Text("Show SnakeBar"),
              ),
              TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'GetX Alert',
                        middleText: 'Simple GetX alert',
                        textConfirm: 'Okay',
                        textCancel: 'Cancel');
                  },
                  child: Text("Show Dialog")),
            ],
          ),
        ),
      ),
    );
  }
}
