import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/pages/edit_tracker/edit_tracker.dart';
import 'package:habitquokka/pages/home/pages/trackers/pages/tracker_details/view_model.dart';
import 'package:habitquokka/router/route.dart';
import 'package:habitquokka/theme/theme.dart';
import 'package:habitquokka/widgets/panel_container.dart';
import 'package:habitquokka/widgets/tracker_widget/tracker_widget.dart';

class TrackerDetailsPage extends StatelessWidget {
  const TrackerDetailsPage({
    super.key,
    required this.viewModel,
    required this.padding,
  });

  final ViewModel viewModel;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          viewModel.tracker.fullName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: BackButton(
          onPressed: () => GoRouter.of(context).go(AppRoute.trackers),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const Icon(Icons.edit_calendar_outlined),
              tooltip: L10n.of(context).trackerDetailsPageEditDrawerButtonLabel,
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        width: Theme.of(context).appSize.modalWidth,
        child: EditTrackerPageConnector(
          tracker: viewModel.tracker,
        ),
      ),
      body: PanelContainer(
        padding: padding.copyWith(top: 0),
        child: Center(
          child: TrackerWidget(
            tracker: viewModel.tracker,
            opened: viewModel.opened,
            onWindowPressed: viewModel.onWindowPressed,
          ),
        ),
      ),
    );
  }
}
