import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String url = 'https://txzrifiojcmxymuqrhoq.supabase.co';
  static const String anonKey =
      'sb_publishable_y0hTeWlNQGf3bG_aBPF_gw_VZSOxNzy';

  static SupabaseClient get client => Supabase.instance.client;

  static Future<void> init() async {
    await Supabase.initialize(url: url, anonKey: anonKey);
  }
}
