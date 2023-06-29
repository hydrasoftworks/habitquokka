import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/pages/home/models/home_destination.dart';
import 'package:habitquokka/widgets/panel.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  static const List<HomeDestination> _destinations = [
    HomeDestination.pricing,
    HomeDestination.community,
    HomeDestination.about,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Panel(
        child: ListView.builder(
            itemCount: _destinations.length,
            itemBuilder: (context, index) {
              final destination = _destinations[index];
              return ListTile(
                onTap: () => GoRouter.of(context).go(destination.path),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text(destination.name(L10n.of(context))),
              );
            }),
      ),
    );
  }
}
