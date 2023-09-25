import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/componentes/bottom_bar.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  _Historico createState() => _Historico();
}

class _Historico extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.gray,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.orange,
        title: Text('Historico'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 4,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(
            16,
            (index) {
              return Center(
                  child: Column(
                children: [
                  Text(
                    'Dia $index',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Tempo $index',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ));
            },
          )),
    );
  }
}
