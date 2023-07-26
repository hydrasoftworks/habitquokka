import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/widgets/inline_span_button.dart';

class LegalTermsWidget extends StatelessWidget {
  const LegalTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: L10n.of(context).authenticationPageLegalLabelPart1,
        children: <InlineSpan>[
          inlineSpanButton(
            label: L10n.of(context).authenticationPageLegalLabelPart2,
            onPressed: () => GoRouter.of(context).push(AppRoute.termsOfService),
          ),
          TextSpan(
            text: L10n.of(context).authenticationPageLegalLabelPart3,
          ),
          inlineSpanButton(
            label: L10n.of(context).authenticationPageLegalLabelPart4,
            onPressed: () => GoRouter.of(context).push(AppRoute.privacyPolicy),
          ),
          TextSpan(
            text: L10n.of(context).authenticationPageLegalLabelPart5,
          ),
        ],
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
