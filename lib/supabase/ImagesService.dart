import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:typed_data';

class ImagesService {
  Future<void> uploadImage(File image) async {
    final storage = Supabase.instance.client.storage;
    final bucket = storage.from('images');
    // Converter File para Uint8List
    // Converter File para Uint8List
    Uint8List fileBytes = await image.readAsBytes();

    final uploadResponse = await bucket.uploadBinary(
        'fotos${image.path.split('/').last}', fileBytes);

    // URL da imagem carregada
    final imageUrl = bucket.getPublicUrl('fotos${image.path.split('/').last}');
    print('URL da Imagem: $imageUrl');
  }
}
