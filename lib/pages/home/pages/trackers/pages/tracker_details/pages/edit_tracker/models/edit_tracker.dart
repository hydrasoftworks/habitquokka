import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'edit_tracker.gform.dart';

@ReactiveFormAnnotation()
class EditTracker {
  const EditTracker({
    @FormControlAnnotation() this.name,
    @FormControlAnnotation(
      validators: [RequiredValidator()],
    )
    this.shortName = '',
    @FormControlAnnotation() this.randomizeNumbers = true,
  });

  final String? name;
  final String shortName;
  final bool randomizeNumbers;
}
