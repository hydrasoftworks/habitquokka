// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountStateCWProxy {
  AccountState isAuthenticated(bool isAuthenticated);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountState call({
    bool? isAuthenticated,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountState.copyWith.fieldName(...)`
class _$AccountStateCWProxyImpl implements _$AccountStateCWProxy {
  const _$AccountStateCWProxyImpl(this._value);

  final AccountState _value;

  @override
  AccountState isAuthenticated(bool isAuthenticated) =>
      this(isAuthenticated: isAuthenticated);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountState call({
    Object? isAuthenticated = const $CopyWithPlaceholder(),
  }) {
    return AccountState(
      isAuthenticated: isAuthenticated == const $CopyWithPlaceholder() ||
              isAuthenticated == null
          ? _value.isAuthenticated
          // ignore: cast_nullable_to_non_nullable
          : isAuthenticated as bool,
    );
  }
}

extension $AccountStateCopyWith on AccountState {
  /// Returns a callable class that can be used as follows: `instanceOfAccountState.copyWith(...)` or like so:`instanceOfAccountState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountStateCWProxy get copyWith => _$AccountStateCWProxyImpl(this);
}
