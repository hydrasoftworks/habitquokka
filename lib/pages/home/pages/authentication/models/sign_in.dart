import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import 'package:habitquokka/models/validators.dart';

part 'sign_in.gform.dart';

@ReactiveFormAnnotation()
class SignIn {
  const SignIn({
    @FormControlAnnotation(
      validators: [requiredValidator, emailValidator],
    )
    this.email = '',
    @FormControlAnnotation() this.otp,
  });

  final String email;
  final String? otp;
}
