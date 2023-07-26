import 'package:flutter/material.dart';

class AppStyle {
  //Primary Colors
  static const Color primary1 = Color.fromRGBO(253, 195, 79, 1);
  static const Color primary2 = Color.fromRGBO(255, 115, 0, 1);
  static const Color primary3 = Color.fromRGBO(249, 61, 164, 1);
  static const Color primary4 = Color.fromRGBO(250, 78, 218, 1);

  static const Color black = Color.fromRGBO(6, 5, 6, 1);
  static const Color white = Color.fromRGBO(230, 231, 231, 1);

  //Secondary Colors
  static const Color secondary1 = Color.fromARGB(255, 255, 255, 255);

  static const Gradient appGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(255, 200, 200, 1),
      Color.fromRGBO(254, 243, 229, 1), // Replace with your desired colors
      Color.fromRGBO(168, 221, 255, 1),
    ],
  );
}
