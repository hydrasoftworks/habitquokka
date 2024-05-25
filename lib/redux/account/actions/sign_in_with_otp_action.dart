import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:habitquokka/models/exception_code.dart';
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

  @override
  Object? wrapError(Object error, StackTrace stackTrace) {
    return switch (error) {
      AuthException(message: final message, statusCode: '400') => UserException(
          message,
          code: AppExceptionCode.signInActionUserNotFound,
        ).addCause(error),
      _ => super.wrapError(error, stackTrace)
    };
  }
}
