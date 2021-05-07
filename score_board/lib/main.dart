import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scorebord/page/home/homebinding.dart';
import 'package:scorebord/page/home/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: 'Home',
      getPages: [
        GetPage(name: 'Home', page: () => Home(), binding: HomeBinding())
      ],
    );
  }
}
