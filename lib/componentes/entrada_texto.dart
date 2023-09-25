import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';

class EntradaTexto extends StatelessWidget {
  final controller;
  final String hintText;
  final int maxLines;

  const EntradaTexto({
    super.key,
    required this.controller,
    required this.hintText,
    required this.maxLines,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.orange,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
