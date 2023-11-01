import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/componentes/botao.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';
import 'package:sprint2/supabase/TimeService.dart';

class Cronometro extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Cronometro> {
  double porcentagem = 0.0;
  int minutos = 25;
  late Timer timer;

  _startTimer() {
    porcentagem = 0;
    minutos = 25;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        minutos = minutos - 1;
        porcentagem += 0.04;
        if (porcentagem >= 1) {
          minutos = 0;
          porcentagem = 0;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.gray,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text(
                'Cronômetro',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),
              CircularPercentIndicator(
                percent: porcentagem,
                animation: true,
                animateFromLastPercent: true,
                radius: 100,
                lineWidth: 20.0,
                progressColor: AppTheme.colors.orange,
                center: Text(
                  "$minutos",
                  style: TextStyle(
                    color: AppTheme.colors.orange,
                    fontSize: 30,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Text(
                'Tempo de estudo: 25 minutos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Botao(
                texto: "Iniciar estudos",
                onTap: _startTimer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
