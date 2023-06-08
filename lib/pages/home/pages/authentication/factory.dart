import 'package:habitquokka/pages/home/pages/authentication/connector.dart';
import 'package:habitquokka/pages/home/pages/authentication/view_model.dart';
import 'package:habitquokka/redux/account/actions/sign_in_with_otp_action.dart';
import 'package:habitquokka/redux/account/actions/sign_on_with_otp_action.dart';
import 'package:habitquokka/redux/account/actions/verify_otp_action.dart';
import 'package:habitquokka/redux/redux.dart';

class Factory
    extends VmFactory<AppState, AuthenticationPageConnector, ViewModel> {
  Factory(super.widget);

  @override
  ViewModel fromStore() => ViewModel(
        onSignOnWithOTP: (username, email) => dispatch(
          SignOnWithOTPAction(username: username, email: email),
        ),
        onSignInWithOTP: (email) => dispatch(SignInWithOTPAction(email: email)),
        onVerifyOTP: (email, otp, type) => dispatch(
          VerifyOTPAction(email: email, otp: otp, type: type),
        ),
      );
}
