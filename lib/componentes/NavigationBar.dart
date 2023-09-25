import 'package:flutter/material.dart';
import 'package:sprint2/pages/CriarGrupo.dart';
import 'package:sprint2/pages/Timer2.dart';
import 'package:sprint2/pages/Home.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/pages/Perfil.dart';
import 'package:sprint2/pages/Historico.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
        currentIndex: currentPageIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group_add,
            ),
            label: 'Criar grupo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_month),
            label: 'Histórico',
          ),
        ],
        selectedItemColor:
            Colors.orange, // Define a cor dos ícones selecionados como laranja
        unselectedItemColor:
            Colors.grey, // Define a cor dos ícones não selecionados como cinza
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Home(),
          CriarGrupo(),
          Perfil(),
          Historico(),
        ],
        onPageChanged: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
