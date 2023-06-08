import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:habitquokka/pages/home/pages/authentication/models/sign_in.dart';
import 'package:habitquokka/pages/home/pages/authentication/models/sign_on.dart';
import 'package:habitquokka/redux/redux.dart';

class ViewModel extends Vm {
  ViewModel({
    required this.onSignOnWithOTP,
    required this.onSignInWithOTP,
    required this.onVerifyOTP,
  }) : super(equals: []);

  final void Function(String username, String email) onSignOnWithOTP;
  final void Function(String email) onSignInWithOTP;
  final void Function(String email, String otp, OtpType type) onVerifyOTP;

  void signIn(SignIn model) {
    final otp = model.otp;
    if (otp == null || otp.isEmpty) {
      onSignInWithOTP(model.email);
    } else {
      onVerifyOTP(model.email, otp, OtpType.magiclink);
    }
  }

  void signOn(SignOn model) {
    final otp = model.otp;
    if (otp == null || otp.isEmpty) {
      onSignOnWithOTP(model.username, model.email);
    } else {
      onVerifyOTP(model.email, otp, OtpType.signup);
    }
  }
}
