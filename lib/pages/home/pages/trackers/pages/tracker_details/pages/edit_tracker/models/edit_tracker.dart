import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import 'package:habitquokka/models/validators.dart';

part 'edit_tracker.gform.dart';

@ReactiveFormAnnotation()
class EditTracker {
  const EditTracker({
    @FormControlAnnotation() this.name,
    @FormControlAnnotation(validators: [requiredValidator]) this.shortName = '',
    @FormControlAnnotation() this.randomizeNumbers = true,
  });

  final String? name;
  final String shortName;
  final bool randomizeNumbers;
}
