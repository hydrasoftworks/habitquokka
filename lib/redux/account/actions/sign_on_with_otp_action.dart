import 'package:habitquokka/redux/redux.dart';

class SignOnWithOTPAction extends Action {
  SignOnWithOTPAction({
    required this.username,
    required this.email,
    required this.redirect,
  });

  final String username;
  final String email;
  final String redirect;

  @override
  Future<AppState?> reduce() async {
    const domain = String.fromEnvironment('APP_URL');

    await env.supabase.auth.signInWithOtp(
      email: email,
      shouldCreateUser: true,
      emailRedirectTo: domain + redirect,
      data: {AccountState.usernameKey: username},
    );
    return null;
  }
}
