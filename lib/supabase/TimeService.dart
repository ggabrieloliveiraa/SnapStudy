import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';

class TimeService {
  Future<void> newTime({
    required String userId,
    required int minutes,
  }) async {
    AuthResponse response = await SupabaseCredentials.supabaseClient
        .from('Tempo')
        .insert({'userId': userId, 'minutos': minutes});
  }
  Future<List<dynamic>> getTimes({
    required String userId,
  }) async {
    final response = await SupabaseCredentials.supabaseClient.from('Tempo').select('minutos, created_at').eq("userId", userId);
    return response;
  }
}