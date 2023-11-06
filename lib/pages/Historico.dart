import 'package:flutter/material.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/supabase/TimeService.dart';
import 'package:sprint2/supabase/SupabaseCredentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  _Historico createState() => _Historico();
}

class _Historico extends State<Historico> {
  Future<List<dynamic>> getTime() async {
    TimeService timeService = TimeService();
    List<dynamic> res = await timeService.getTimes(
        userId: SupabaseCredentials.supabaseClient.auth.currentUser!.id);
    return res;
  }
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
      body: FutureBuilder<List<dynamic>>(
        future: getTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading indicator while waiting for data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<dynamic> time = snapshot.data!;
            return GridView.count(
              crossAxisCount: 4,
              children: List.generate(
                time.length,
                (index) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          'Dia $index',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          '${time[index]['minutos']} minutos',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
