import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/componentes/bottom_bar.dart';
import 'package:sprint2/supabase/AuthenticationService.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  _Perfil createState() => _Perfil();
}




class _Perfil extends State<Perfil> {
  bool _passwordVisible = false;
  void changePassowrd() async {
    AuthenticationService authService = AuthenticationService();
    authService.changePassword(
        id: SupabaseCredentials.supabaseClient.auth.currentUser!.id,
        password: senhaController.text);
  }
  final senhaController = TextEditingController();
  @override
  void initState() {
    _passwordVisible = false;
  }
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
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
                width: 480,
                child: TextField(
                  controller: senhaController,
                  obscureText: !_passwordVisible,
                  style: TextStyle(color: AppTheme.colors.dark_gray),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: AppTheme.colors.dark_gray),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'lib/images/password.png',
                          height: 5,
                          width: 5,
                        ),
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppTheme.colors.dark_gray),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          }),
                      hintText: 'Digite sua senha',
                      hintStyle: TextStyle(
                          color: AppTheme.colors.dark_gray,
                          fontFamily: 'Nunito')),
                )),
              SizedBox(
                width: 480,
                height: 60,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    primary: AppTheme.colors.dark_gray,
                  ),
                  icon:
                      Icon(Icons.arrow_forward, color: AppTheme.colors.orange),
                  label: Text(
                    'Entrar',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: AppTheme.colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () => {
                    changePassowrd(),
                  },
                )),
          ],
        ));
  }
}
