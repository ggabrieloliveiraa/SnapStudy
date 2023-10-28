import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/componentes/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sprint2/pages/CapturaFoto.dart';
import 'package:sprint2/pages/CriarGrupo.dart';
import 'package:sprint2/pages/Timer2.dart';
import 'package:sprint2/pages/Home.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';

class Grupos extends StatefulWidget {
  @override
  _Grupos createState() => _Grupos();
}

class _Grupos extends State<Grupos> {
  final _grupoStream = SupabaseCredentials.supabaseClient
      .from('Grupos')
      .stream(primaryKey: ['id']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return ListTile(
                title: Text(grupos[index]['Nome']),
              );
            },
          );
        },
      ),
    );
  }
}
