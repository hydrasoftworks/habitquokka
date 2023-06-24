import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/community/view_model.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/panel_container.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({
    super.key,
    required this.viewModel,
  });

  final ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PanelContainer(
        child: Align(
          child: SizedBox(
            width: Theme.of(context).appSize.modalWidth,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  L10n.of(context).communityPageTitle,
                  style: GoogleFonts.lilitaOne(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                SizedBox(height: Theme.of(context).appSpacing.medium),
                Text(
                  L10n.of(context).communityPageSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: Theme.of(context).appSpacing.medium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      L10n.of(context).communityPageNotInterestedInCommunity,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(width: Theme.of(context).appSpacing.small),
                    Switch(
                      onChanged: viewModel.onInterestedInCommunityChanged,
                      value: viewModel.interestedInCommunityFeature,
                    ),
                    SizedBox(width: Theme.of(context).appSpacing.small),
                    Text(
                      L10n.of(context).communityPageInterestedInCommunity,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
