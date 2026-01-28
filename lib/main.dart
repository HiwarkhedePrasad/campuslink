import 'package:flutter/material.dart';
import 'core/supabase_client.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Supabase before the app starts
  await SupabaseConfig.init();
  
  runApp(const MyApp());
}
