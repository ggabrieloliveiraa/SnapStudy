import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCredentials {
  static const String APIKEY =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ0c2ZkZmVqd21yZ3VhdGN4bnd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTg0NDYzMTcsImV4cCI6MjAxNDAyMjMxN30.UCvFgm8DEUS_GpzFS_v17eh6ubN6yEguvSLYcEzuu7U";
  static const String APIURL = "https://rtsfdfejwmrguatcxnwx.supabase.co";
  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);
}
