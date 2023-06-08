import 'package:habitquokka/redux/redux.dart';

class SignOnWithOTPAction extends Action {
  SignOnWithOTPAction({
    required this.username,
    required this.email,
  });

  final String username;
  final String email;

  @override
  Future<AppState?> reduce() async {
    await env.supabase.auth.signInWithOtp(
      email: email,
      shouldCreateUser: true,
      emailRedirectTo: Environment.isDebug ? 'http://localhost:50568/' : null,
      data: {'username': username},
    );
    return null;
  }
}
