import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import 'package:habitquokka/models/validators.dart';

part 'sign_on.gform.dart';

@ReactiveFormAnnotation()
class SignOn {
  const SignOn({
    @FormControlAnnotation(
      validators: [requiredValidator],
    )
    this.username = '',
    @FormControlAnnotation(
      validators: [requiredValidator, emailValidator],
    )
    this.email = '',
    @FormControlAnnotation() this.otp,
  });

  final String username;
  final String email;
  final String? otp;
}
