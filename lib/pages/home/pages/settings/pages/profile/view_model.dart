import 'package:habitquokka/models/profile.dart';
import 'package:habitquokka/pages/home/pages/settings/pages/profile/models/edit_profile.dart';
import 'package:habitquokka/redux/redux.dart';

typedef OnUpdateProfile = Future<void> Function(String);
typedef OnDeleteAccount = Future<void> Function();

class ViewModel extends Vm {
  ViewModel({
    required this.profile,
    required this.onUpdateProfile,
    required this.onDeleteAccount,
  }) : super(equals: [profile]);

  final Profile? profile;
  final OnUpdateProfile onUpdateProfile;
  final OnDeleteAccount onDeleteAccount;

  EditProfile? get initialModel {
    final profile = this.profile;
    if (profile == null) return null;

    return EditProfile(username: profile.username);
  }
}
