import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/supabase_client.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseConfig.init();

  runApp(const ProviderScope(child: MyApp()));
}
