import 'package:flutter/material.dart';
import 'package:sprint2/pages/SignUp.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/supabase/AuthenticationService.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});
  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  // controladores do campo de texto
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  // metodo para fazer login
  void login() async {
    AuthenticationService authService = AuthenticationService();
    authService.login(
        email: emailController.text,
        password: senhaController.text,
        context: context);
  }

  @override
  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.orange,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.dark_gray,
        toolbarHeight: 150,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/icon.png',
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Entrar',
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  color: AppTheme.colors.white),
            ),
            SizedBox(height: 10),
            Text("Seja produtivo em comunidade!",
                style: TextStyle(
                    fontFamily: 'Nunito', color: AppTheme.colors.white)),
            SizedBox(height: 30),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Usuário",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: AppTheme.colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            SizedBox(
                width: 480,
                child: TextField(
                  controller: emailController,
                  style: TextStyle(color: AppTheme.colors.white),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: AppTheme.colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'lib/images/email.png',
                          height: 5,
                          width: 5,
                        ),
                      ),
                      hintText: 'Digite seu nome de usuário...',
                      hintStyle: TextStyle(
                          color: AppTheme.colors.white, fontFamily: 'Nunito')),
                )),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Senha",
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: AppTheme.colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
                width: 480,
                child: TextField(
                  controller: senhaController,
                  obscureText: !_passwordVisible,
                  style: TextStyle(color: AppTheme.colors.white),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: AppTheme.colors.white),
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
                          color: AppTheme.colors.white, fontFamily: 'Nunito')),
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 480,
                height: 60,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    primary: AppTheme.colors.white,
                  ),
                  icon:
                      Icon(Icons.arrow_forward, color: AppTheme.colors.orange),
                  label: Text(
                    'Entrar',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: AppTheme.colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () => {
                    login(),
                  },
                )),
            SizedBox(
              height: 50,
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUp(
                              title: '',
                            )),
                  );
                },
                child: Text(
                  "Não possui uma conta? Inscreva-se",
                  style: TextStyle(
                      fontFamily: 'Nunito', color: AppTheme.colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Esqueceu sua senha?",
              style:
                  TextStyle(fontFamily: 'Nunito', color: AppTheme.colors.green),
            )
          ],
        ),
      ),
    );
  }
}
