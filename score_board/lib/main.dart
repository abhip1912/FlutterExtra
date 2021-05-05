import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:score_board/page/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(), // define the light theme
      darkTheme: ThemeData.dark(), // define the dark theme
      themeMode: ThemeMode.light, // default theme
      home: Home(),
    );
  }
}
