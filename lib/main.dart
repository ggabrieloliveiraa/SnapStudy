import 'package:flutter/material.dart';
import 'package:sprint2/pages/SignUp.dart';
import 'package:sprint2/app_theme.dart';
import 'package:sprint2/pages/Home.dart';
import 'package:sprint2/componentes/NavigationBar.dart';
import 'package:sprint2/pages/Login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: "https://rtsfdfejwmrguatcxnwx.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ0c2ZkZmVqd21yZ3VhdGN4bnd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTg0NDYzMTcsImV4cCI6MjAxNDAyMjMxN30.UCvFgm8DEUS_GpzFS_v17eh6ubN6yEguvSLYcEzuu7U",
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Snap Study',
      home: Login(title: 'Snap Study'),
    );
  }
}
