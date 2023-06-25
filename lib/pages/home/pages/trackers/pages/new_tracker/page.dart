import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/models/new_tracker.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/new_tracker/view_model.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/progress_button.dart';

class NewTrackerPage extends StatelessWidget {
  const NewTrackerPage({
    super.key,
    required this.viewModel,
  });

  final ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return NewTrackerFormBuilder(
      model: const NewTracker(),
      builder: (context, formModel, child) {
        return AlertDialog(
          elevation: 4,
          shadowColor: Theme.of(context).colorScheme.shadow,
          title: Text(L10n.of(context).newTrackerPageTitle),
          actions: [
            TextButton(
              onPressed: () => GoRouter.of(context).pop(),
              child: Text(L10n.of(context).generalCancel),
            ),
            ProgressButton(
              onPressed: () => _submitForm(formModel),
              label: L10n.of(context).newTrackerPageCreateButtonLabel,
            ),
          ],
          content: SizedBox(
            width: Theme.of(context).appSize.modalWidth,
            child: _Form(formModel: formModel),
          ),
        );
      },
    );
  }

  Future<void> _submitForm(NewTrackerForm formModel) async {
    formModel.form.markAllAsTouched();
    if (!formModel.form.valid) return;
    return viewModel.createTracker(formModel.model);
  }
}

class _Form extends StatelessWidget {
  const _Form({
    required this.formModel,
  });

  final NewTrackerForm formModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Theme.of(context).appSpacing.medium,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ReactiveTextField<String>(
            formControl: formModel.shortNameControl,
            validationMessages: {
              ValidationMessage.required: (_) =>
                  L10n.of(context).trackerFormShortNameRequiredValidation,
            },
            decoration: InputDecoration(
              labelText: L10n.of(context).trackerFormShortNameLabel,
              helperText: L10n.of(context).trackerFormShortNameTooltip,
              hintText: L10n.of(context).trackerFormShortNameHint,
            ),
          ),
          SizedBox(height: Theme.of(context).appSpacing.medium),
          ReactiveTextField<String>(
            formControl: formModel.nameControl,
            decoration: InputDecoration(
              labelText: L10n.of(context).trackerFormNameLabel,
              helperText: L10n.of(context).trackerFormNameTooltip,
              hintText: L10n.of(context).trackerFormNameHint,
            ),
          ),
        ],
      ),
    );
  }
}
