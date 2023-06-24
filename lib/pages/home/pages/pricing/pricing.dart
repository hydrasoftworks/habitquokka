import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class PricingPage extends StatelessWidget {
  const PricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PanelContainer(
        child: Center(
          child: SizedBox(
            width: Theme.of(context).appSize.modalWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  L10n.of(context).pricingPageTitle,
                  style: GoogleFonts.lilitaOne(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                SizedBox(height: Theme.of(context).appSpacing.medium),
                Text(
                  L10n.of(context).pricingPageSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
