import 'package:habitquokka/redux/redux.dart';

class SignInWithOTPAction extends Action {
  SignInWithOTPAction({
    required this.email,
  });

  final String email;

  @override
  Future<AppState?> reduce() async {
    await env.supabase.auth.signInWithOtp(
      email: email,
      shouldCreateUser: false,
      emailRedirectTo: Environment.isDebug ? 'http://localhost:50568/' : null,
    );
    return null;
  }
}
