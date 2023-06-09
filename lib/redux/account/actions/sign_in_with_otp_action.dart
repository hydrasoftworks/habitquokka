import 'package:habitquokka/redux/redux.dart';

class SignInWithOTPAction extends Action {
  SignInWithOTPAction({
    required this.email,
    required this.redirect,
  });

  final String email;
  final String redirect;

  @override
  Future<AppState?> reduce() async {
    const domain = String.fromEnvironment('APP_URL');

    await env.supabase.auth.signInWithOtp(
      email: email,
      shouldCreateUser: false,
      emailRedirectTo: domain + redirect,
    );
    return null;
  }
}
