import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import 'package:habitquokka/models/validators.dart';

part 'authentication.gform.dart';

@ReactiveFormAnnotation()
class Authentication {
  const Authentication({
    @FormControlAnnotation(
      validators: [requiredValidator, emailValidator],
    )
    this.email = '',
  });

  final String email;
}
