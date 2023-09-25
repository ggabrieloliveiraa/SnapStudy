import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:get/get.dart';
import 'preview_page.dart';
import 'package:sprint2/componentes/botao.dart';
import 'package:sprint2/widgets/AnexoFoto.dart';
import 'dart:io';

class CapturaFoto extends StatefulWidget {
  _Captura createState() => _Captura();
}

class _Captura extends State<CapturaFoto> {
  // funcao para enviar foto(backend nao feito ainda)
  enviarFoto() {}
  File? arquivo;
  showPreview(file) async {
    file = await Get.to(() => PreviewPage(file: file));
    if (file != null) {
      setState(() => arquivo = file);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.gray,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.orange,
        title: Text('Câmera'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            if (arquivo != null) AnexoFoto(arquivo: arquivo!),
            IconButton(
              onPressed: () => Get.to(
                () => CameraCamera(onFile: (file) => showPreview(file)),
              ),
              icon: Icon(
                color: AppTheme.colors.orange,
                Icons.photo_camera_rounded,
                size: 50,
              ),
            ),
            const SizedBox(height: 10),
            Botao(
              texto: "Enviar foto",
              onTap: enviarFoto,
            ),
          ],
        ),
      )),
    );
  }
}
