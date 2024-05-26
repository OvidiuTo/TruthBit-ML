import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xffCCC5B9),
    secondary: Color(0xff403D39),
    surface: Color(0xffEB5E28),
    tertiary: Color(0xff252422),
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        // fontFamily: 'Nova',
        bodyColor: const Color(0xffFFFCF2),
        displayColor: const Color(0xffFFFCF2),
      ),
);
