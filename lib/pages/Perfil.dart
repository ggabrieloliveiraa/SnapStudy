import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/componentes/bottom_bar.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  _Perfil createState() => _Perfil();
}

class _Perfil extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.colors.gray,
        appBar: AppBar(
          backgroundColor: AppTheme.colors.orange,
          title: Text('Perfil'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      30.0), // Half of 300 to make it a circle
                  child: Image.asset(
                    'lib/images/cat.png', // Path to your image asset
                    width: 300.0,
                    height: 300.0,
                    fit: BoxFit
                        .cover, // You can use BoxFit.cover to cover the entire area
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              SupabaseCredentials.supabaseClient.auth.currentUser!.email!,
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  color: AppTheme.colors.dark_gray),
            ),
          ],
        ));
  }
}
