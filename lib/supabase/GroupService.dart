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
}
