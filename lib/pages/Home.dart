import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/pages/Grupo.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';
import 'package:sprint2/componentes/card_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final _grupoStream = SupabaseCredentials.supabaseClient
      .from('Grupo')
      .stream(primaryKey: ['id']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.gray,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.orange,
        title: Text('Grupos'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _grupoStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final grupos = snapshot.data!;
          return ListView.builder(
            itemCount: grupos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Grupo(
                            nomeGrupo: grupos[index]['Nome'] ?? "Sem nome",
                            descGrupo:
                                grupos[index]['Desc'] ?? "Sem descricao")),
                  );
                  // Aqui você pode definir o que acontece quando o CardItem é tocado
                  print('CardItem ${grupos[index]['Nome']} foi tocado');
                },
                child: CardItem(
                  title: grupos[index]['Nome'] ?? "Sem nome",
                  description: grupos[index]['Desc'] ?? "Sem descricao",
                  imageAsset: "lib/images/cat.png",
                ),
              );
            },
          );
        },
      ),
    );
  }
}