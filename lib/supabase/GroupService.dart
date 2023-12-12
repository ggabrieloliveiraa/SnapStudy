import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';

class GroupService {
  Future<void> newGroup({
    required String nome,
    required String desc,
  }) async {
    AuthResponse response = await SupabaseCredentials.supabaseClient
        .from('Grupo')
        .insert({'Nome': nome, 'Desc': desc});
  }

  final client = SupabaseClient('your-supabase-url', 'your-supabase-key');

  Future<void> entrarNoGrupo({
    required int idGrupo,
  }) async {
    final idUsuario = SupabaseCredentials
        .supabaseClient.auth.currentUser!.id; // Obtenha o ID do usuário logado
    if (idUsuario == null) {
      print("USUARIO NAO ENCONTRADO :(");
      // Lidar com erro de usuário não logado
      return;
    }
    print("funfo");
    AuthResponse response = await SupabaseCredentials.supabaseClient
        .from('membrosgrupo')
        .insert({'idgrupo': idGrupo, 'idusuario': idUsuario});

    if (response != null) {
      // Lidar com o erro
      print('Erro ao entrar no grupo');
    } else {
      // Sucesso
      print('Usuário entrou no grupo com sucesso');
    }
  }
}
