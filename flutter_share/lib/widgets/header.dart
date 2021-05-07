import 'package:flutter/material.dart';

header(BuildContext context,
    {myTitle = "FlutterShare", myFontFamily = "Signatra", myFontSize = 50.0}) {
  return AppBar(
    title: Text(
      myTitle,
      style: TextStyle(
        color: Colors.white,
        fontFamily: myFontFamily,
        fontSize: myFontSize,
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
