import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:habitquokka/pages/home/pages/authentication/models/sign_in.dart';
import 'package:habitquokka/pages/home/pages/authentication/models/sign_up.dart';
import 'package:habitquokka/redux/redux.dart';

typedef OnSignUpWithOTP = Future<bool> Function(
  String username,
  String email,
  String redirect,
);
typedef OnSignInWithOTP = Future<bool> Function(
  String email,
  String redirect,
);
typedef OnVerifyOTP = Future<bool> Function(
  String email,
  String otp,
  OtpType type,
);

class ViewModel extends Vm {
  ViewModel({
    required this.isAuthenticated,
    required this.onSignUpWithOTP,
    required this.onSignInWithOTP,
    required this.onVerifyOTP,
  }) : super(equals: [isAuthenticated]);

  final bool isAuthenticated;

  final OnSignUpWithOTP onSignUpWithOTP;
  final OnSignInWithOTP onSignInWithOTP;
  final OnVerifyOTP onVerifyOTP;

  Future<bool> signIn(SignIn model, String redirect) {
    final otp = model.otp;
    if (otp == null || otp.isEmpty) {
      return onSignInWithOTP(model.email, redirect);
    } else {
      return onVerifyOTP(model.email, otp, OtpType.email);
    }
  }

  Future<bool> signUp(SignUp model, String redirect) {
    final otp = model.otp;
    if (otp == null || otp.isEmpty) {
      return onSignUpWithOTP(model.username, model.email, redirect);
    } else {
      return onVerifyOTP(model.email, otp, OtpType.email);
    }
  }
}
