import 'dart:ui';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/redux/redux.dart';

abstract class AppExceptionCode {
  static Map<int, String>? _messages;

  static const int signInActionUserNotFound = 1;
  static const int createTrackerActionUserNotLoggedIn = 2;
  static const int regenerateImageAPIUsageLimit = 3;

  static void setTranslations([Locale? locale]) {
    if (locale == null) return;
    if (_messages?.isNotEmpty ?? false) return;
    _messages ??= _generateMessages(locale);
    UserException.translateCode = (code) => _messages?[code] ?? '';
  }

  static Map<int, String> _generateMessages(Locale locale) {
    final l10n = lookupL10n(locale);
    return {
      createTrackerActionUserNotLoggedIn:
          l10n.userExceptionCreateTrackerActionUserNotLoggedIn,
      signInActionUserNotFound: l10n.userExceptionSignInActionUserNotFound,
      regenerateImageAPIUsageLimit:
          l10n.userExceptionRegenerateImageAPIUsageLimit,
    };
  }
}
