import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:habitquokka/redux/redux.dart';

class VerifyOTPAction extends Action {
  VerifyOTPAction({
    required this.email,
    required this.otp,
    required this.type,
  });

  final String email;
  final String otp;
  final OtpType type;

  @override
  Future<AppState?> reduce() async {
    final response = await env.supabase.auth.verifyOTP(
      email: email,
      token: otp,
      type: type,
    );

    return state.copyWith(
      accountState: accountState.copyWith(
        isAuthenticated: response.user != null,
      ),
    );
  }
}
