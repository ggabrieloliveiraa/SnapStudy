import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/pages/CapturaFoto.dart';
import 'package:sprint2/pages/Timer2.dart';
import 'package:sprint2/componentes/card_item.dart';
import 'package:sprint2/componentes/botao.dart';
import 'package:sprint2/supabase/GroupService.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';
import 'package:sprint2/supabase/ImagesService.dart';

class Grupo extends StatefulWidget {
  final String nomeGrupo;
  final String descGrupo;
  final int idGrupo;

  const Grupo({
    Key? key,
    required this.nomeGrupo,
    required this.idGrupo,
    required this.descGrupo,
  }) : super(key: key);

  @override
  _Grupo createState() => _Grupo();
}

class _Grupo extends State<Grupo> {
  final ImagesService imageService = ImagesService();
  late final Stream<List<Map<String, dynamic>>> _membroStream;

  String getEmail() {
    String email = "aaaaaaaaa";
    return email;
  }

  @override
  void initState() {
    print(widget.idGrupo);
    super.initState();
    _membroStream = SupabaseCredentials.supabaseClient
        .from('membrosgrupo')
        .stream(primaryKey: ['id']).eq(
            'idgrupo', widget.idGrupo); // Usa o valor de idGrupo do widget
  }

  void entrarGrupo() {
    GroupService groupService = GroupService();
    groupService.entrarNoGrupo(idGrupo: widget.idGrupo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.gray,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.white,
        toolbarHeight: 150,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 55.0, // Set the desired height in pixels.
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.nomeGrupo,
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        color: AppTheme.colors.dark_gray,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        entrarGrupo();
                        // Coloque aqui a ação que você quer realizar
                      },
                      child: Text(
                        "Clique aqui",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.descGrupo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                  color: AppTheme.colors.dark_gray,
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        ),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _membroStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final grupos = snapshot.data!;
          return ListView.builder(
            itemCount: grupos.length,
            itemBuilder: (context, index) {
              return FutureBuilder<String?>(
                future: imageService.fetchLatestImageByUserId(
                    grupos[index]['idusuario'].toString()),
                builder: (context, imageSnapshot) {
                  String imageAsset =
                      imageSnapshot.data ?? "lib/images/cat.png";

                  return CardItem(
                    title: grupos[index]['idusuario'] ?? "Sem nome",
                    description: grupos[index]['Desc'] ?? "TEMPO",
                    imageAsset: imageAsset,
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomAppBar(
        
        child: Row(
          children: [
            const SizedBox(width: 90),
            IconButton(
              icon: Icon(
                Icons.photo_camera_rounded,
                size: 50,
                color: AppTheme.colors.orange,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CapturaFoto()),
                );
              },
            ),
            const SizedBox(width: 100), // Espaçamento entre os botões
            IconButton(
              icon: Icon(
                Icons.timer,
                size: 50,
                color: AppTheme.colors.orange,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Timer2()),
                );
              },
            ),
          ],
        ),
      ),)
    );
  }
}
