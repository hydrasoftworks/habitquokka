import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/pages/edit_tracker/models/edit_tracker.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/pages/edit_tracker/view_model.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/panel_container.dart';
import 'package:habitquokka/widgets/progress_button.dart';

typedef OnEditTracker = Future<void> Function(EditTracker);
typedef OnDeleteTracker = Future<void> Function();

class EditTrackerPage extends StatelessWidget {
  const EditTrackerPage({
    super.key,
    required this.viewModel,
  });

  final ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).editTrackerPageTitle),
        leading: const CloseButton(),
      ),
      body: PanelContainer(
        padding: PanelContainer.defaultPadding.copyWith(top: 0),
        child: EditTrackerFormBuilder(
          model: viewModel.initialModel,
          builder: (context, formModel, child) => _Form(
            formModel: formModel,
            onEditTracker: (model) async {
              final scaffold = Scaffold.of(context);
              await viewModel.editTracker(model);
              scaffold.closeEndDrawer();
            },
            onDeleteTracker: () async {
              final router = GoRouter.of(context);
              await viewModel.onDeleteTracker();
              router.go(AppRoute.trackers);
            },
          ),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({
    required this.formModel,
    required this.onEditTracker,
    required this.onDeleteTracker,
  });

  final EditTrackerForm formModel;
  final OnEditTracker onEditTracker;
  final OnDeleteTracker onDeleteTracker;

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
          SizedBox(height: Theme.of(context).appSpacing.medium),
          ProgressButton(
            onPressed: _submitForm,
            label: L10n.of(context).editTrackerSaveButtonLabel,
          ),
          const Spacer(),
          ProgressButton(
            onPressed: onDeleteTracker,
            foregroundColor: Theme.of(context).colorScheme.onError,
            backgroundColor: Theme.of(context).colorScheme.error,
            label: L10n.of(context).editTrackerDeleteButtonLabel,
          ),
        ],
      ),
    );
  }

  Future<void> _submitForm() async {
    formModel.form.markAllAsTouched();
    if (!formModel.form.valid) return;
    await onEditTracker(formModel.model);
  }
}
