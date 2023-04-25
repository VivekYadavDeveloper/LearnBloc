import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.purple.shade300,
      canvasColor: Colors.white,
      appBarTheme: AppBarTheme(
          color: Colors.blue[500],
          iconTheme: const IconThemeData(color: Colors.white)),
      iconTheme: IconThemeData(color: Colors.blue[400]),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.grey[800],
        ),
        bodyMedium: TextStyle(color: Colors.grey[800]),
        headlineMedium: TextStyle(color: Colors.grey[900]),
      ),
      unselectedWidgetColor: Colors.blue[400],
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blueAccent,
        textTheme: ButtonTextTheme.primary,
      ));



      // **** --------> Dark Theme <-----------
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey[700],
      canvasColor: Colors.grey[800],
      colorScheme: ColorScheme.dark(secondary: Colors.grey.shade300),
      appBarTheme: AppBarTheme(
          color: Colors.grey[900],
          iconTheme: IconThemeData(color: Colors.grey[100])),
      iconTheme: IconThemeData(color: Colors.grey[300]),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.grey[100],
          ),
          bodyMedium: TextStyle(color: Colors.grey[100]),
          headlineMedium: TextStyle(color: Colors.grey[50])),
      unselectedWidgetColor: Colors.grey[300],
      dividerColor: Colors.grey[500],
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[900], textTheme: ButtonTextTheme.primary));
}
