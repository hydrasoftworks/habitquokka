import 'package:habitquokka/pages/home/pages/authentication/connector.dart';
import 'package:habitquokka/pages/home/pages/authentication/view_model.dart';
import 'package:habitquokka/redux/account/actions/sign_in_with_otp_action.dart';
import 'package:habitquokka/redux/account/actions/sign_up_with_otp_action.dart';
import 'package:habitquokka/redux/account/actions/verify_otp_action.dart';
import 'package:habitquokka/redux/redux.dart';

class Factory
    extends VmFactory<AppState, AuthenticationPageConnector, ViewModel> {
  Factory(super.widget);

  @override
  ViewModel fromStore() => ViewModel(
        isAuthenticated: state.accountState.isAuthenticated,
        onSignUpWithOTP: (username, email, redirect) => dispatchAsync(
          SignUpWithOTPAction(
            username: username,
            email: email,
            redirect: redirect,
          ),
        ).then((status) => status.isFinished),
        onSignInWithOTP: (email, redirect) => dispatchAsync(
          SignInWithOTPAction(email: email, redirect: redirect),
        ).then((status) => status.isFinished),
        onVerifyOTP: (email, otp, type) => dispatchAsync(
          VerifyOTPAction(email: email, otp: otp, type: type),
        ).then((status) => status.isFinished),
      );
}
