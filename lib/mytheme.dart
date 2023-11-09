// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAppTheme {
  static ThemeData get themeData {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: outlineInputBorder,
        errorBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      // Define your font family here
      fontFamily: 'Lora', // Replace with your font family name
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              textStyle: TextStyle(fontSize: 18, fontFamily: 'Lora'))),
      textTheme: TextTheme(
        // Apply the custom font to various text styles
        bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        // You can define other text styles here as needed
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.blue,
  ),
);
