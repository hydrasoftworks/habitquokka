import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import 'package:habitquokka/models/validators.dart';

part 'new_tracker.gform.dart';

@ReactiveFormAnnotation()
class NewTracker {
  const NewTracker({
    @FormControlAnnotation() this.name,
    @FormControlAnnotation(validators: [requiredValidator]) this.shortName = '',
  });

  final String? name;
  final String shortName;
}
