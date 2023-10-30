import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/pages/CapturaFoto.dart';
import 'package:sprint2/pages/Timer2.dart';
import 'package:sprint2/componentes/card_item.dart';

class Grupo extends StatefulWidget {
  final String nomeGrupo;
  final String descGrupo;

  const Grupo({Key? key, required this.nomeGrupo, required this.descGrupo})
      : super(key: key);

  _Grupo createState() => _Grupo();
}

class _Grupo extends State<Grupo> {
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
                            color: AppTheme.colors.dark_gray),
                      ),
                      Text(
                        'Alterar',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            color: AppTheme.colors.dark_gray),
                      )
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
                      color: AppTheme.colors.dark_gray),
                )
              ],
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        ),
      ),
      //bottomNavigationBar: BottomBar(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30.0), // Add a 30-pixel space here
          Expanded(
            child: CardList(),
          ),
          Row(
            children: [
              const SizedBox(height: 80),
              SizedBox(width: 90),
              IconButton(
                icon: Icon(
                  color: AppTheme.colors.orange,
                  Icons.photo_camera_rounded,
                  size: 50,
                ),
                onPressed: () {
                  // Navegar para a página 2 quando o botão for pressionado
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CapturaFoto()),
                  );
                },
              ),
              SizedBox(width: 220), // Espaçamento entre os botões
              IconButton(
                icon: Icon(
                  color: AppTheme.colors.orange,
                  Icons.timer,
                  size: 50,
                ),
                onPressed: () {
                  // Navegar para a página 3 quando o botão for pressionado
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Timer2()),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
