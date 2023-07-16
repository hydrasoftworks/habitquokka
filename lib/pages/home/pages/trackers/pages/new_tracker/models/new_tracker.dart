import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'new_tracker.gform.dart';

@ReactiveFormAnnotation()
class NewTracker {
  const NewTracker({
    @FormControlAnnotation() this.name,
    @FormControlAnnotation(
      validators: [RequiredValidator()],
    )
    this.shortName = '',
  });

  final String? name;
  final String shortName;
}
