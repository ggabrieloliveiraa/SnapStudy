import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';

class TimeService {
  Future<void> newTime({
    required String userId,
    required int minutes,
  }) async {
    List<dynamic> check = await SupabaseCredentials.supabaseClient
        .from('Tempo')
        .select('id, minutos, dia').eq("userId", userId).eq("dia", DateTime.now().toIso8601String());

    print(check);
    if(check.isNotEmpty){
      await SupabaseCredentials.supabaseClient
          .from('Tempo')
          .update({'minutos': minutes + check[0]['minutos']})
          .eq('id', check[0]['id']);
      print(minutes + check[0]['minutos']);
      print(check[0]['id']);
    }else {
      await SupabaseCredentials.supabaseClient
          .from('Tempo')
          .insert({'userId': userId,'minutos': minutes, 'dia': DateTime.now().toIso8601String()});
    }
  }
  Future<List<dynamic>> getTimes({
    required String userId,
  }) async {
    final response = await SupabaseCredentials.supabaseClient.from('Tempo').select('minutos, created_at').eq("userId", userId);
    return response;
  }
}