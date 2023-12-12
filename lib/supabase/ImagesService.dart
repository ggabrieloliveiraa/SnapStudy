import 'dart:io';
import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';

class ImagesService {
  Future<void> uploadImage(File image) async {
    final storage = Supabase.instance.client.storage;
    final bucket = storage.from('images');

    Uint8List fileBytes = await image.readAsBytes();
    String fileName = 'fotos/${image.path.split('/').last}';

    final uploadResponse = await bucket.uploadBinary(fileName, fileBytes);

    // URL da imagem carregada
    final imageUrl = bucket.getPublicUrl(fileName);

    // Inserir registro na tabela de imagens
    final response = await Supabase.instance.client.from('images').insert({
      'user_id': SupabaseCredentials.supabaseClient.auth.currentUser!.id,
      'image_url': imageUrl,
      'uploaded_at': DateTime.now().toIso8601String() // Data e hora do upload
    });

    print('Imagem carregada e registrada com sucesso! URL: $imageUrl');
  }
}
