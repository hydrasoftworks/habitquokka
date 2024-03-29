import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/models/profile.dart';
import 'package:habitquokka/pages/home/pages/authentication/models/sign_up.dart';
import 'package:habitquokka/pages/home/pages/authentication/pages/sign_up/widgets/legal_terms_widget.dart';
import 'package:habitquokka/pages/home/pages/authentication/widgets/switch_page.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/progress_button.dart';

typedef OnSignUp = Future<bool> Function(SignUp);

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
    required this.onSwitchToSignIn,
    required this.onSignUp,
  });

  final VoidCallback onSwitchToSignIn;
  final OnSignUp onSignUp;

  @override
  Widget build(BuildContext context) {
    return SignUpFormBuilder(
      model: const SignUp(),
      builder: (context, formModel, child) {
        return _Form(
          formModel: formModel,
          onSwitchToSignIn: onSwitchToSignIn,
          onSignUp: onSignUp,
        );
      },
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    required this.formModel,
    required this.onSwitchToSignIn,
    required this.onSignUp,
  });

  final SignUpForm formModel;

  final VoidCallback onSwitchToSignIn;
  final OnSignUp onSignUp;

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
            L10n.of(context).authenticationPageSignUpTitle,
            style: GoogleFonts.lilitaOne(
              textStyle: Theme.of(context).textTheme.headlineMedium,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          SizedBox(height: Theme.of(context).appSpacing.small),
          SwitchPage(
            labelText: L10n.of(context).authenticationPageSignUpSubtitlePart1,
            buttonText: L10n.of(context).authenticationPageSignUpSubtitlePart2,
            onPressed: widget.onSwitchToSignIn,
          ),
          SizedBox(height: Theme.of(context).appSpacing.large),
          ReactiveTextField<String>(
            formControl: widget.formModel.usernameControl,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.continueAction,
            validationMessages: {
              ValidationMessage.required: (_) =>
                  L10n.of(context).profileFormUsernameRequiredValidation,
              ValidationMessage.maxLength: (data) =>
                  L10n.of(context).profileFormUsernameMaxLengthValidation(
                    Profile.maxUsernameLength,
                  ),
            },
            decoration: InputDecoration(
              labelText: L10n.of(context).profileFormUsernameLabel,
              helperText: L10n.of(context).profileFormUsernameTooltip,
              hintText: L10n.of(context).profileFormUsernameHint,
            ),
          ),
          SizedBox(height: Theme.of(context).appSpacing.medium),
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
          const LegalTermsWidget(),
          SizedBox(height: Theme.of(context).appSpacing.large),
          Center(
            child: ProgressButton(
              onPressed: _submitForm,
              label: L10n.of(context).authenticationPageButtonLabel,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitForm() async {
    widget.formModel.form.markAllAsTouched();
    if (!widget.formModel.form.valid) return;
    final completed = await widget.onSignUp(widget.formModel.model);
    if (completed) setState(() => _showOTPField = true);
  }
}
