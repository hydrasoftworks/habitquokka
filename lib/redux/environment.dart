import 'package:flutter/foundation.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class Environment {
  const Environment({
    required this.supabase,
  });

  static const bool isDebug = kDebugMode;

  final SupabaseClient supabase;
}
