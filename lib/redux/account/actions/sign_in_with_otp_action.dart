import 'package:habitquokka/redux/redux.dart';

class SignInWithOTPAction extends Action {
  SignInWithOTPAction({
    required this.email,
  });

  final String email;

  @override
  Future<AppState?> reduce() async {
    await env.supabase.auth.signInWithOtp(email: email);
    return null;
  }
}
