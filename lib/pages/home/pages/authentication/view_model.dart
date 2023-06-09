import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:habitquokka/pages/home/pages/authentication/models/sign_in.dart';
import 'package:habitquokka/pages/home/pages/authentication/models/sign_on.dart';
import 'package:habitquokka/redux/redux.dart';

typedef OnSignOnWithOTP = Future<void> Function(
  String username,
  String email,
  String redirect,
);
typedef OnSignInWithOTP = Future<void> Function(
  String email,
  String redirect,
);
typedef OnVerifyOTP = Future<void> Function(
    String email, String otp, OtpType type);

class ViewModel extends Vm {
  ViewModel({
    required this.isAuthenticated,
    required this.onSignOnWithOTP,
    required this.onSignInWithOTP,
    required this.onVerifyOTP,
  }) : super(equals: [isAuthenticated]);

  final bool isAuthenticated;

  final OnSignOnWithOTP onSignOnWithOTP;
  final OnSignInWithOTP onSignInWithOTP;
  final OnVerifyOTP onVerifyOTP;

  Future<void> signIn(SignIn model, String redirect) {
    final otp = model.otp;
    if (otp == null || otp.isEmpty) {
      return onSignInWithOTP(model.email, redirect);
    } else {
      return onVerifyOTP(model.email, otp, OtpType.magiclink);
    }
  }

  Future<void> signOn(SignOn model, String redirect) {
    final otp = model.otp;
    if (otp == null || otp.isEmpty) {
      return onSignOnWithOTP(model.username, model.email, redirect);
    } else {
      return onVerifyOTP(model.email, otp, OtpType.signup);
    }
  }
}
