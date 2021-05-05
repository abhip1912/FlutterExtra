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
                  Get.changeThemeMode(
                      ThemeMode.light); // insted of themeData used themeMode
                },
              ),
              ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text('Dark Theam'),
                onTap: () {
                  print('darth theam');
                  Get.changeThemeMode(
                      ThemeMode.dark); // insted of themeData used themeMode
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
