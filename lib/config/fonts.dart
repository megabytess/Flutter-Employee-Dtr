import 'package:flutter/material.dart';

//create a custom text theme where i can modify the text styles and use the default if not specified

class CapoyCustomTextTheme {
  static TextTheme of(BuildContext context) {
    return Theme.of(context).textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 40,
            fontWeight: FontWeight.w900,
            wordSpacing: 0,
          ),
          displayLarge: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 40,
            fontWeight: FontWeight.w700,
            wordSpacing: 0,
          ),
          displayMedium: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          displaySmall: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 15,
            fontWeight: FontWeight.w100,
          ),
          headlineLarge: const TextStyle(
            fontFamily: "ArchivoBlack",
            fontSize: 30,
            fontWeight: FontWeight.w500,
            wordSpacing: 0,
          ),
          headlineMedium: const TextStyle(
            fontFamily: "Sen",
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        );
  }
}
