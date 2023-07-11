import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/settings/pages/profile/view_model.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/panel.dart';
import 'package:habitquokka/widgets/progress_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.padding,
    required this.viewModel,
  });

  final EdgeInsets padding;
  final ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(L10n.of(context).profilePageTitle),
        leading: BackButton(
          onPressed: () => GoRouter.of(context).go(AppRoute.settings),
        ),
      ),
      body: Panel(
        padding: padding.copyWith(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const Divider(),
            Text(
              L10n.of(context).profilePageDangerZoneTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: Theme.of(context).appSpacing.small),
            Text(
              L10n.of(context).profilePageDangerZoneSubtitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: Theme.of(context).appSpacing.medium),
            Center(
              child: ProgressButton(
                onPressed: () => _deleteAccount(context),
                foregroundColor: Theme.of(context).colorScheme.onError,
                backgroundColor: Theme.of(context).colorScheme.error,
                label: L10n.of(context).profilePageDeleteButtonLabel,
              ),
            ),
            SizedBox(height: Theme.of(context).appSpacing.medium),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteAccount(BuildContext context) async {
    final router = GoRouter.of(context);
    final deleteAccount = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L10n.of(context).profilePageDeleteAccountDialogTitle),
        content: Text(L10n.of(context).profilePageDeleteAccountDialogSubtitle),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(L10n.of(context).generalCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(L10n.of(context).generalDelete),
          ),
        ],
      ),
    );
    if (deleteAccount == true) {
      await viewModel.onDeleteAccount();
      router.go(AppRoute.onboarding);
    }
  }
}
