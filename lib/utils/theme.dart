import 'package:flutter/material.dart';

class MyColors {
  static Color primary = Colors.teal[900];
  static Color secondary = Color(0XFF3D5896);
  static Color third = Color(0XFFC2CCED);
  static Color blue = Color(0XFF1878F3);

  static Map<String, Color> darklight = {
    "dark": Color(0XFF171717),
    "light": Color(0XFFEBEBEB),
  };
}

class MyTextStyles {
  static TextStyle bigTitle = TextStyle(
      fontFamily: 'Montserrat',
      color: MyColors.third,
      fontSize: 20.0,
      fontWeight: FontWeight.bold);
  static TextStyle title = TextStyle(
      fontFamily: 'Montserrat',
      color: MyColors.third, fontSize: 18.0, fontWeight: FontWeight.bold);
  static TextStyle subTitle = TextStyle(
    fontFamily: 'Montserrat',
    color: MyColors.third,
    fontSize: 16.0,
  );
}
