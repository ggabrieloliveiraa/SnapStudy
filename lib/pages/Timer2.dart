import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class Timer2 extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer2> {
  @override
  Widget build(BuildContext context) {
    final CountDownController controller = new CountDownController();
    return Scaffold(
        backgroundColor: AppTheme.colors.gray,
        appBar: AppBar(
          backgroundColor: AppTheme.colors.orange,
          title: Text('Cronômetro'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeonCircularTimer(
                  onComplete: () {
                    controller.restart();
                  },
                  width: 200,
                  controller: controller,
                  duration: 1500,
                  strokeWidth: 10,
                  isTimerTextShown: true,
                  neumorphicEffect: true,
                  outerStrokeColor: Colors.grey.shade100,
                  innerFillGradient: LinearGradient(colors: [
                    AppTheme.colors.red,
                    AppTheme.colors.orange,
                  ]),
                  neonGradient: LinearGradient(colors: [
                    AppTheme.colors.red,
                    AppTheme.colors.orange,
                  ]),
                  strokeCap: StrokeCap.round,
                  innerFillColor: Colors.black12,
                  backgroudColor: Colors.grey.shade100,
                  neonColor: AppTheme.colors.orange),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          icon: Icon(
                            color: AppTheme.colors.orange,
                            Icons.play_arrow,
                          ),
                          onPressed: () {
                            controller.resume();
                          }),
                      IconButton(
                          icon: Icon(
                            color: AppTheme.colors.orange,
                            Icons.pause,
                          ),
                          onPressed: () {
                            controller.pause();
                          }),
                      IconButton(
                          icon: Icon(
                            color: AppTheme.colors.orange,
                            Icons.repeat,
                          ),
                          onPressed: () {
                            controller.restart();
                          }),
                    ]),
              ),
              Text(
                'Tempo de estudo: 25 minutos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
