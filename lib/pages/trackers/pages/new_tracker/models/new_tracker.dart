import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'new_tracker.gform.dart';

Map<String, dynamic>? requiredValidator(AbstractControl<dynamic> control) {
  return Validators.required(control);
}

@ReactiveFormAnnotation()
class NewTracker {
  const NewTracker({
    @FormControlAnnotation() this.name,
    @FormControlAnnotation(validators: [requiredValidator]) this.shortName = '',
  });

  final String? name;
  final String shortName;
}
