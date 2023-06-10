import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/authentication/models/sign_on.dart';
import 'package:habitquokka/pages/home/pages/authentication/widgets/switch_page.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/progress_button.dart';

typedef OnSignOn = Future<void> Function(SignOn);

class SignOnPage extends StatelessWidget {
  const SignOnPage({
    super.key,
    required this.onSwitchToSignIn,
    required this.onSignOn,
  });

  final VoidCallback onSwitchToSignIn;
  final OnSignOn onSignOn;

  @override
  Widget build(BuildContext context) {
    return SignOnFormBuilder(
      model: const SignOn(),
      builder: (context, formModel, child) {
        return _Form(
          formModel: formModel,
          onSwitchToSignIn: onSwitchToSignIn,
          onSignOn: onSignOn,
        );
      },
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    required this.formModel,
    required this.onSwitchToSignIn,
    required this.onSignOn,
  });

  final SignOnForm formModel;

  final VoidCallback onSwitchToSignIn;
  final OnSignOn onSignOn;

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  bool _showOTPField = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          L10n.of(context).authenticationPageSignOnTitle,
          style: GoogleFonts.lilitaOne(
            textStyle: Theme.of(context).textTheme.headlineMedium,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        SizedBox(height: Theme.of(context).appSpacing.small),
        SwitchPage(
          labelText: L10n.of(context).authenticationPageSignOnSubtitlePart1,
          buttonText: L10n.of(context).authenticationPageSignOnSubtitlePart2,
          onPressed: widget.onSwitchToSignIn,
        ),
        SizedBox(height: Theme.of(context).appSpacing.large),
        ReactiveTextField<String>(
          formControl: widget.formModel.usernameControl,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.continueAction,
          readOnly: _showOTPField,
          validationMessages: {
            ValidationMessage.required: (_) =>
                L10n.of(context).authenticationPageUsernameRequiredValidation,
          },
          decoration: InputDecoration(
            labelText: L10n.of(context).authenticationPageUsernameLabel,
            helperText: L10n.of(context).authenticationPageUsernameTooltip,
            hintText: L10n.of(context).authenticationPageUsernameHint,
          ),
        ),
        SizedBox(height: Theme.of(context).appSpacing.medium),
        ReactiveTextField<String>(
          formControl: widget.formModel.emailControl,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.continueAction,
          readOnly: _showOTPField,
          validationMessages: {
            ValidationMessage.required: (_) =>
                L10n.of(context).authenticationPageEmailRequiredValidation,
            ValidationMessage.email: (_) =>
                L10n.of(context).authenticationPageEmailValidation,
          },
          decoration: InputDecoration(
            labelText: L10n.of(context).authenticationPageEmailLabel,
            helperText: L10n.of(context).authenticationPageEmailTooltip,
            hintText: L10n.of(context).authenticationPageEmailHint,
          ),
        ),
        SizedBox(height: Theme.of(context).appSpacing.medium),
        if (_showOTPField) ...[
          ReactiveTextField<String>(
            formControl: widget.formModel.otpControl,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.continueAction,
            decoration: InputDecoration(
              labelText: L10n.of(context).authenticationPageOTPLabel,
              helperText: L10n.of(context).authenticationPageOTPTooltip,
              hintText: L10n.of(context).authenticationPageOTPHint,
            ),
          ),
          SizedBox(height: Theme.of(context).appSpacing.medium),
        ],
        Text(L10n.of(context).authenticationPageLegalLabel),
        SizedBox(height: Theme.of(context).appSpacing.large),
        ProgressButton(
          onPressed: _submitForm,
          label: L10n.of(context).authenticationPageButtonLabel,
        ),
      ],
    );
  }

  Future<void> _submitForm() async {
    widget.formModel.form.markAllAsTouched();
    if (!widget.formModel.form.valid) return;
    await widget.onSignOn(widget.formModel.model);
    setState(() => _showOTPField = true);
  }
}
