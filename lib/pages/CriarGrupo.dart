import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/componentes/entrada_texto.dart';
import 'package:sprint2/componentes/botao.dart';
import 'package:sprint2/supabase/GroupService.dart';

class CriarGrupo extends StatelessWidget {
  CriarGrupo({super.key});

  // controladores do campo de texto
  final nomeGrupo = TextEditingController();
  final descGrupo = TextEditingController();

  // metodo para criar novo grupo (nao funciona por enquanto)
  void novoGrupo() {
    GroupService groupService = GroupService();
    groupService.newGroup(
      nome: nomeGrupo.text,
      desc: descGrupo.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.gray,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.orange,
        title: Text('Criar grupo'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text(
                'Crie agora a sua comunidade!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              // nome do grupo textfield
              EntradaTexto(
                controller: nomeGrupo,
                hintText: 'Insira o nome do grupo',
                maxLines: 1,
              ),
              const SizedBox(height: 45),
              // descrição do grupo textfield
              EntradaTexto(
                controller: descGrupo,
                hintText:
                    'Insira a descrição do grupo (sobre o grupo, objetivos, recompensas, etc...)',
                maxLines: 5,
              ),
              const SizedBox(height: 25),
              Text(
                'Convidar amigos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.email),
              const SizedBox(height: 25),
              Botao(
                texto: "Continuar",
                onTap: novoGrupo,
              )
            ],
          ),
        ),
      ),
    );
  }
}
