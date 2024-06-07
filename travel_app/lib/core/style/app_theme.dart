import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.green),
    primaryColor: AppColors.blue,
    textTheme: const TextTheme(
      bodySmall: TextStyle( fontFamily: 'Montserrat'),
      bodyMedium: TextStyle(fontFamily: 'Montserrat'),
      bodyLarge: TextStyle(fontFamily: 'Montserrat'),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.grey),
    primaryColor: Colors.black,
    iconTheme: const IconThemeData(
      color: Colors.red
    ),
    scaffoldBackgroundColor: Colors.black38,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
      bodyMedium: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
      bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
    ),
  );
}
