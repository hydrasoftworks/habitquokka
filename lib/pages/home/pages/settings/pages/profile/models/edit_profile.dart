import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import 'package:habitquokka/models/profile.dart';

part 'edit_profile.gform.dart';

@ReactiveFormAnnotation()
class EditProfile {
  const EditProfile({
    @FormControlAnnotation(
      validators: [
        RequiredValidator(),
        MaxLengthValidator(Profile.maxUsernameLength),
      ],
    )
    this.username = '',
  });

  final String username;
}
