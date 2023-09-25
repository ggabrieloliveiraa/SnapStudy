import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static const colors = AppColors();
  static const TextStyle defaultTextStyle = TextStyle(
    fontFamily: 'Nunito',
    );
  
  const AppTheme._();

  static  ThemeData define() {
    return ThemeData(
      primaryColor: Color(0xFFE07E22),
    );
  }
  
}