import 'package:supabase_flutter/supabase_flutter.dart';

class Environment {
  const Environment({
    required this.supabase,
  });

  final SupabaseClient supabase;
}
