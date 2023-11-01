import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';

class TimeService {
  Future<void> newTime({
    required String userId,
    required String minutes,
  }) async {
    AuthResponse response = await SupabaseCredentials.supabaseClient
        .from('Tempo')
        .insert({'UserId': userId, 'minutos': minutes});
  }
}     