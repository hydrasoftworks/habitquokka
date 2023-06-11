import 'dart:ui';

import 'package:habitquokka/l10n/l10n.dart';
import 'package:habitquokka/redux/redux.dart';

enum Code {
  createTrackerActionUserNotLoggedIn,
}

class AppExceptionCode extends ExceptionCode {
  const AppExceptionCode(this.code);

  final Code code;

  static Map<Code, String>? _messages;

  @override
  String? asText([Locale? locale]) {
    if (locale == null) return null;
    _messages ??= _generateMessages(locale);
    return _messages?[code];
  }

  Map<Code, String> _generateMessages(Locale locale) {
    final l10n = lookupL10n(locale);
    return {
      Code.createTrackerActionUserNotLoggedIn:
          l10n.userExceptionCreateTrackerActionUserNotLoggedIn,
    };
  }
}
