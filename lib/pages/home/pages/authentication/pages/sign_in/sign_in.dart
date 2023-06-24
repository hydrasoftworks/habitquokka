import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/authentication/models/sign_in.dart';
import 'package:habitquokka/pages/home/pages/authentication/widgets/switch_page.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/progress_button.dart';

typedef OnSignIn = Future<bool> Function(SignIn);

class SignInPage extends StatelessWidget {
  const SignInPage({
    super.key,
    required this.onSwitchToSignOn,
    required this.onSignIn,
  });

  final VoidCallback onSwitchToSignOn;
  final OnSignIn onSignIn;

  @override
  Widget build(BuildContext context) {
    return SignInFormBuilder(
      model: const SignIn(),
      builder: (context, formModel, child) {
        return _Form(
          formModel: formModel,
          onSwitchToSignOn: onSwitchToSignOn,
          onSignIn: onSignIn,
        );
      },
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    required this.formModel,
    required this.onSwitchToSignOn,
    required this.onSignIn,
  });

  final SignInForm formModel;

  final VoidCallback onSwitchToSignOn;
  final OnSignIn onSignIn;

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  bool _showOTPField = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            L10n.of(context).authenticationPageSignInTitle,
            style: GoogleFonts.lilitaOne(
              textStyle: Theme.of(context).textTheme.headlineMedium,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          SizedBox(height: Theme.of(context).appSpacing.small),
          SwitchPage(
            labelText: L10n.of(context).authenticationPageSignInSubtitlePart1,
            buttonText: L10n.of(context).authenticationPageSignInSubtitlePart2,
            onPressed: widget.onSwitchToSignOn,
          ),
          SizedBox(height: Theme.of(context).appSpacing.large),
          ReactiveTextField<String>(
            formControl: widget.formModel.emailControl,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.continueAction,
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
          if (_showOTPField)
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
          ProgressButton(
            onPressed: _submitForm,
            label: L10n.of(context).authenticationPageButtonLabel,
          ),
        ],
      ),
    );
  }

  Future<void> _submitForm() async {
    widget.formModel.form.markAllAsTouched();
    if (!widget.formModel.form.valid) return;
    final completed = await widget.onSignIn(widget.formModel.model);
    if (completed) setState(() => _showOTPField = true);
  }
}
