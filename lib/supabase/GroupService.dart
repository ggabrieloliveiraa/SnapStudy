import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';
import 'package:flutter/material.dart';

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
