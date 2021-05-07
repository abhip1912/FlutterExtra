import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scorebord/page/model/model.dart';

class HomeController extends GetxController {
  TextEditingController nameController;
  // TextEditingController scoreController;
  var name = 'Add vlaue';
  // var score = '0'.obs;
  UserModel user;
  var userList = <UserModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    // scoreController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.dispose();
    // scoreController.dispose();
  }

  UserModel addName() {
    print('before $userList');
    if (nameController.text.isNotEmpty) {
      return user = UserModel(
        name: nameController.text,
        score: '0',
        scoreController: TextEditingController(),
      );
    } else {
      return null;
    }
  }

  scorePluse(int index) {
    print(userList[index].scoreController.text);
    if (userList[index].scoreController.text.isNotEmpty) {
      int temp1 = int.parse(userList[index].score.toString());
      int temp2 = int.parse(userList[index].scoreController.text);
      print('after');
      print(userList[index].score);
      temp1 = (temp1 + temp2);
      print(temp1);
      userList[index] = UserModel(
        name: userList[index].name,
        score: temp1.toString(),
        scoreController: TextEditingController(),
      );
      userList[index].score = temp1.toString();
      print('0 vale is ');
      print('1 valur is ');
      print(userList[1].score);
    }
  }

  void scoreMinus(int index) {
    print(userList[index].scoreController.text);
    if (userList[index].scoreController.text.isNotEmpty) {
      int temp1 = int.parse(userList[index].score.toString());
      int temp2 = int.parse(userList[index].scoreController.text);
      print('after');
      print(userList[index].score);
      temp1 = (temp1 - temp2);
      userList[index].score = temp1.toString();
    }
  }
}
