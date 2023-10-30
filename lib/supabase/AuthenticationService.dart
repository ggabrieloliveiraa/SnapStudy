import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';
import 'package:flutter/material.dart';
import 'package:sprint2/componentes/NavigationBar.dart';

class AuthenticationService {
  Future<void> signup({
    required String email,
    required String password,
  }) async {
    AuthResponse response = await SupabaseCredentials.supabaseClient.auth
        .signUp(email: email, password: password);
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final AuthResponse res =
        await SupabaseCredentials.supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final Session? session = res.session;
    final User? user = res.user;
    if (res.session != null) {
      print("Login bem-sucedido para o usuário: ${res.user!.email}, ${SupabaseCredentials.supabaseClient.auth.currentUser!.id!}");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavigationBarApp()),
      );
    } else {
      print("Login mal-sucedido");
    }
  }

  Future<void> changePassword({
    required String id,
    required String password,
  }) async {
    final UserResponse res = await SupabaseCredentials.supabaseClient.auth.updateUser(
      UserAttributes(
        password: password,
      )
    );
    if (res != null) {
      print(res);
    } else {
      print("não mudou senha");
    }
  }

  Future<void> logout() async {
    await SupabaseCredentials.supabaseClient.auth.signOut();
  }
}
