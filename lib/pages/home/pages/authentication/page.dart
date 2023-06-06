import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/authentication/models/authentication.dart';
import 'package:habitquokka/pages/home/pages/authentication/view_model.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({
    super.key,
    required this.viewModel,
  });

  final ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PanelContainer(
          child: AuthenticationFormBuilder(
            model: const Authentication(),
            builder: (context, formModel, child) {
              return Center(
                child: SizedBox(
                  width: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        L10n.of(context).authenticationPageTitle,
                        style: GoogleFonts.lilitaOne(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      SizedBox(height: Theme.of(context).appSpacing.large),
                      ReactiveTextField<String>(
                        formControl: formModel.emailControl,
                        validationMessages: {
                          ValidationMessage.required: (_) => L10n.of(context)
                              .authenticationPageEmailRequiredValidation,
                          ValidationMessage.email: (_) => L10n.of(context)
                              .authenticationPageEmailValidation,
                        },
                        decoration: InputDecoration(
                          labelText:
                              L10n.of(context).authenticationPageEmailLabel,
                          helperText:
                              L10n.of(context).authenticationPageEmailTooltip,
                          hintText:
                              L10n.of(context).authenticationPageEmailHint,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: Theme.of(context).appSpacing.medium),
                      FilledButton(
                        onPressed: () {
                          formModel.form.markAllAsTouched();
                          if (!formModel.form.valid) return;
                          viewModel.onSignInWithOTP(formModel.model.email);
                        },
                        child: Text(
                            L10n.of(context).authenticationPageButtonLabel),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
