import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/supabase/TimeService.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  _Historico createState() => _Historico();
}

class Event {
  final int minutos;
  final DateTime dia;

  const Event(this.minutos, this.dia);
  String toString() {
    return 'Event{name: $minutos, date: $dia}';
  }
}

class _Historico extends State<Historico> {
  String _selectedEvents = "0";
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Future<List<Event>> getTime() async {
    TimeService timeService = TimeService();
    DateTime dt = DateTime.now();
    List<dynamic> res = await timeService.getTimes(
        userId: SupabaseCredentials.supabaseClient.auth.currentUser!.id);
    List<Event> mesAtual = [];
    for (int i = 0; i < res.length; i++) {
      res[i]['dia'] = DateTime.parse(res[i]['dia']);
      mesAtual.add(Event(res[i]['minutos'], res[i]['dia']));
    }
    mesAtual = (mesAtual
        .where((element) => element.dia.month == DateTime.now().month)
        .toList());
    return mesAtual;
  }

  @override
  Widget build(BuildContext context) {
    CalendarFormat _calendarFormat = CalendarFormat.month;
    return Scaffold(
        backgroundColor: AppTheme.colors.gray,
        appBar: AppBar(
          backgroundColor: AppTheme.colors.orange,
          title: Text('Historico'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: Column(
          children: [
            FutureBuilder<List<Event>>(
              future: getTime(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    selectedDayPredicate: (day) {
                      print(_selectedDay);
                      if (isSameDay(_selectedDay, day)) print(day);
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        _selectedEvents =
                            _getEventsForDay(snapshot.data!, selectedDay)[0]!
                                .minutos
                                .toString();
                      });
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    eventLoader: (day) {
                      return _getEventsForDay(snapshot.data!, day);
                    },
                  );
                }
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ValueListenableBuilder<String>(
                valueListenable: ValueNotifier<String>(_selectedEvents),
                builder: (context, value, _) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: ListTile(
                      onTap: () => print(""),
                      title: Text('Você estudou $value minutos')
                    )
                  );
                })
          ],
        ));
  }

  List<Event> _getEventsForDay(List<Event> times, DateTime day) {
    return (times.where((element) => element.dia.day == day.day).toList());
  }
}
