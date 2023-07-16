import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'sign_in.gform.dart';

@ReactiveFormAnnotation()
class SignIn {
  const SignIn({
    @RfControl(
      validators: [RequiredValidator(), EmailValidator()],
    )
    this.email = '',
    @FormControlAnnotation() this.otp,
  });

  final String email;
  final String? otp;
}
