import 'package:flutter/material.dart';
import 'package:get/get.dart';

IconButton buildIconButton() {
  return IconButton(
    icon: Icon(Icons.lightbulb_outline_rounded),
    onPressed: () {
      Get.bottomSheet(
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
          ),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.wb_sunny_outlined),
                title: Text('Light Theam'),
                onTap: () {
                  print('light theam');
                  Get.changeThemeMode(ThemeMode.light);
                },
              ),
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Dark Theam'),
                onTap: () {
                  print('darth theam');
                  Get.changeThemeMode(ThemeMode.dark);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

final bottomStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
);

final nameTextFieldDecoration = InputDecoration(
    border: OutlineInputBorder(),
    hintText: "Enter Your Name",
    labelText: "Name");

final nameTextFieldTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

final nameTextFieldTheamData = ThemeData(
  primaryColor: Colors.black87,
  primaryColorDark: Colors.teal,
);

final bottomSheetDecoration = BoxDecoration(
  color: Colors.blue,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  ),
);

final scoreTextfieldStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey);
