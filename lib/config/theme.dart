import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red[900],
          secondary: Colors.black12,
          //background: Colors.red[900],
          //tertiary: Colors.red[900],
        ),
      );
}
