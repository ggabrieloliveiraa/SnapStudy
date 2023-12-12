import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';

class UserService {
  Future<String?> fetchEmailByUserId(String userId) async {
    final response = await SupabaseCredentials.supabaseClient
        .from('usuarios')
        .select('email')
        .eq('id', userId)
        .single();

    return response['email'] as String?;
  }
}
