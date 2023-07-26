import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'sign_up.gform.dart';

@ReactiveFormAnnotation()
class SignUp {
  const SignUp({
    @FormControlAnnotation(
      validators: [RequiredValidator()],
    )
    this.username = '',
    @FormControlAnnotation(
      validators: [RequiredValidator(), EmailValidator()],
    )
    this.email = '',
    @FormControlAnnotation() this.otp,
  });

  final String username;
  final String email;
  final String? otp;
}
