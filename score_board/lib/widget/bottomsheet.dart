import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:scorebord/page/home/homecontroller.dart';
import 'package:scorebord/page/model/model.dart';
import 'package:scorebord/widget/communmodual.dart';

class BottomShit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();

    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: bottomSheetDecoration,
      height: 300,
      child: Column(
        children: [
          SizedBox(
            height: 20,
            width: 50,
            child: Divider(
              thickness: 2,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Theme(
                  data: nameTextFieldTheamData,
                  child: TextFormField(
                    style: nameTextFieldTextStyle,
                    keyboardType: TextInputType.text,
                    controller: homeController.nameController,
                    decoration: nameTextFieldDecoration,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back(result: homeController.addName());
                  homeController.nameController.clear();
                },
                child: Text('Create'),
                style: bottomStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
