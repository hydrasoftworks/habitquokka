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
        isAuthenticated: state.accountState.isAuthenticated,
        onSignOnWithOTP: (username, email, redirect) => dispatchAsync(
          SignOnWithOTPAction(
            username: username,
            email: email,
            redirect: redirect,
          ),
        ),
        onSignInWithOTP: (email, redirect) => dispatchAsync(
          SignInWithOTPAction(email: email, redirect: redirect),
        ),
        onVerifyOTP: (email, otp, type) => dispatchAsync(
          VerifyOTPAction(email: email, otp: otp, type: type),
        ),
      );
}
