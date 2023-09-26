import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/componentes/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sprint2/pages/CapturaFoto.dart';
import 'package:sprint2/pages/CriarGrupo.dart';
import 'package:sprint2/pages/Timer2.dart';
import 'package:sprint2/pages/Home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  _Home createState() => _Home();
}

class _Home extends State<Home> {
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
                        'GrupoBacana',
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
                  'Descrição bacana do grupo bacana eita como é bacana esse grupo',
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
              SizedBox(width:90),
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

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CardItem(
            imageAsset: 'lib/images/cat.png',
            title: 'Pessoa1',
            description: 'Tempo total: 00:00',
          ),
          CardItem(
            imageAsset: 'lib/images/cat.png',
            title: 'Pessoa2',
            description: 'Tempo total: 00:00',
          ),
          CardItem(
            imageAsset: 'lib/images/cat.png',
            title: 'Pessoa3',
            description: 'Tempo total: 00:00',
          ),
          CardItem(
            imageAsset: 'lib/images/cat.png',
            title: 'Pessoa4',
            description: 'Tempo total: 00:00',
          ),
          CardItem(
            imageAsset: 'lib/images/cat.png',
            title: 'Pessoa5',
            description: 'Tempo total: 00:00',
          ),
          CardItem(
            imageAsset: 'lib/images/cat.png',
            title: 'Pessoa6',
            description: 'Tempo total: 00:00',
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  CardItem(
      {required this.imageAsset,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          // Imagem
          ClipRRect(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust the radius as needed
            child: Container(
              width: 100.0, // Adjust the width for your image size
              height: 100.0, // Square dimensions
              child: Image.asset(imageAsset, fit: BoxFit.cover),
            ),
          ),
          // Texto
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        color: AppTheme.colors.dark_gray),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.normal,
                        color: AppTheme.colors.dark_gray),
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
