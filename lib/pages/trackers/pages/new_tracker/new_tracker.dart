import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/trackers/pages/new_tracker/models/new_tracker.dart';
import 'package:habitquokka/theme/theme.dart';

class NewTrackerAlertPage extends StatelessWidget {
  const NewTrackerAlertPage({super.key});

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
            TextButton(
              onPressed: () {
                formModel.form.markAllAsTouched();
                if (!formModel.form.valid) return;
                // TODO: Create new tracker
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: Text(L10n.of(context).newTrackerPageCreateButtonLabel),
            ),
          ],
          content: SizedBox(
            width: 400,
            child: _Form(formModel: formModel),
          ),
        );
      },
    );
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
                  L10n.of(context).newTrackerPageShortNameRequiredValidation,
            },
            decoration: InputDecoration(
              labelText: L10n.of(context).newTrackerPageShortNameLabel,
              helperText: L10n.of(context).newTrackerPageShortNameTooltip,
              hintText: L10n.of(context).newTrackerPageShortNameHint,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(height: Theme.of(context).appSpacing.medium),
          ReactiveTextField<String>(
            formControl: formModel.nameControl,
            decoration: InputDecoration(
              labelText: L10n.of(context).newTrackerPageNameLabel,
              helperText: L10n.of(context).newTrackerPageNameTooltip,
              hintText: L10n.of(context).newTrackerPageNameHint,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
