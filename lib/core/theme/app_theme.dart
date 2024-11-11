import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xff888888),
        ),
        titleTextStyle: TextStyle(
          color: Color(0xff888888),
          fontSize: 18,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.black,
      ),
    );
  }

  static ThemeData dark(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black.withOpacity(0.8),
        foregroundColor: Colors.white,
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      scaffoldBackgroundColor: Colors.black26,
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      textTheme: TextTheme(
        displaySmall: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
        bodySmall: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
            ),
        bodyMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
