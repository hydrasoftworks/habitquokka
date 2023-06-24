import 'package:flutter/foundation.dart';

import 'package:habitquokka/redux/redux.dart';

class ViewModel extends Vm {
  ViewModel({
    required this.interestedInCommunityFeature,
    required this.onInterestedInCommunityChanged,
  }) : super(equals: [
          interestedInCommunityFeature,
        ]);

  final bool interestedInCommunityFeature;
  final ValueChanged<bool> onInterestedInCommunityChanged;
}
