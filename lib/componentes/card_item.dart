import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';

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

  const CardItem({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    // Determina se o caminho da imagem é uma URL ou um ativo local
    final isNetworkImage = Uri.tryParse(imageAsset)?.hasAbsolutePath ?? false;

    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          // Imagem
          ClipRRect(
            borderRadius: BorderRadius.circular(
                10.0), // Ajuste o raio conforme necessário
            child: Container(
              width: 100.0, // Ajuste a largura conforme o tamanho da sua imagem
              height: 100.0, // Dimensões quadradas
              child: isNetworkImage
                  ? Image.network(imageAsset, fit: BoxFit.cover)
                  : Image.asset(imageAsset, fit: BoxFit.cover),
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
