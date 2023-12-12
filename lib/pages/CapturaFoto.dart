import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/componentes/botao.dart';
import 'package:sprint2/pages/preview_page.dart';
import 'package:sprint2/widgets/AnexoFoto.dart';
import 'package:sprint2/supabase/ImagesService.dart';

class CapturaFoto extends StatefulWidget {
  @override
  _Captura createState() => _Captura();
}

class _Captura extends State<CapturaFoto> {
  dynamic arquivo; // Alterado para tipo dinâmico
  final picker = ImagePicker();

  Future getFileFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        arquivo = File(pickedFile.path);
        ImagesService imagesService = ImagesService();
        imagesService.uploadImage(arquivo);
      });
    }
  }

  void enviarFoto() {
    // Lógica para enviar a foto para o backend (ainda não implementada)
    // Implemente essa lógica de acordo com suas necessidades
  }

  showPreview(file) async {
    final arq = await Get.to(() => PreviewPage(file: file));

    if (arq != null) {
      setState(() => arquivo = arq);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.orange,
        title: const Text('Câmera'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (arquivo != null)
                  Column(
                    children: [
                      AnexoFoto(arquivo: arquivo),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: enviarFoto,
                        child: Text('Enviar Foto'),
                      ),
                    ],
                  ),
                OutlinedButton.icon(
                  icon: Icon(Icons.attach_file),
                  label: Text('Selecione um arquivo'),
                  onPressed: () => getFileFromGallery(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:sprint2/app_theme.dart';
// import 'package:camera_camera/camera_camera.dart';
// import 'package:get/get.dart';
// import 'preview_page.dart';
// import 'package:sprint2/componentes/botao.dart';
// import 'package:sprint2/widgets/AnexoFoto.dart';
// import 'dart:io';

// class CapturaFoto extends StatefulWidget {
//   _Captura createState() => _Captura();
// }

// class _Captura extends State<CapturaFoto> {
//   // funcao para enviar foto(backend nao feito ainda)
//   enviarFoto() {}
//   File? arquivo;
//   showPreview(file) async {
//     file = await Get.to(() => PreviewPage(file: file));
//     if (file != null) {
//       setState(() => arquivo = file);
//       Get.back();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.colors.gray,
//       appBar: AppBar(
//         backgroundColor: AppTheme.colors.orange,
//         title: const Text('Câmera'),
//       ),
//       body: const Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             if (arquivo != null) AnexoFoto(arquivo: arquivo!),
//             IconButton(
//               onPressed: () => Get.to(
//                 () => CameraCamera(onFile: (file) => showPreview(file)),
//               ),
//               icon: Icon(
//                 color: AppTheme.colors.orange,
//                 Icons.photo_camera_rounded,
//                 size: 50,
//               ),
//             ),
//             SizedBox(height: 10),
//             Botao(
//               texto: "Enviar foto",
//               onTap: enviarFoto,
//             ),
//           ],
//           )],),)
      
//     );
//   }
// }

//bodyyyyyyyyyyy
// SafeArea(
      //     child: Center(
      //   child: Column(
      //     children: [
      //       if (arquivo != null) AnexoFoto(arquivo: arquivo!),
      //       IconButton(
      //         onPressed: () => Get.to(
      //           () => CameraCamera(onFile: (file) => showPreview(file)),
      //         ),
      //         icon: Icon(
      //           color: AppTheme.colors.orange,
      //           Icons.photo_camera_rounded,
      //           size: 50,
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       Botao(
      //         texto: "Enviar foto",
      //         onTap: enviarFoto,
      //       ),
      //     ],
      //   ),
      // )),
      