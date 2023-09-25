import 'dart:io';

import 'package:flutter/material.dart';

class AnexoFoto extends StatelessWidget {
  final File arquivo;

  AnexoFoto({Key? key, required this.arquivo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Center(
        child: SizedBox(
          width: 500,
          height: 500,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.file(
              arquivo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
