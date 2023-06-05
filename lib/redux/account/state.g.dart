// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountStateCWProxy {
  AccountState isSignedIn(bool isSignedIn);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountState call({
    bool? isSignedIn,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountState.copyWith.fieldName(...)`
class _$AccountStateCWProxyImpl implements _$AccountStateCWProxy {
  const _$AccountStateCWProxyImpl(this._value);

  final AccountState _value;

  @override
  AccountState isSignedIn(bool isSignedIn) => this(isSignedIn: isSignedIn);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountState call({
    Object? isSignedIn = const $CopyWithPlaceholder(),
  }) {
    return AccountState(
      isSignedIn:
          isSignedIn == const $CopyWithPlaceholder() || isSignedIn == null
              ? _value.isSignedIn
              // ignore: cast_nullable_to_non_nullable
              : isSignedIn as bool,
    );
  }
}

extension $AccountStateCopyWith on AccountState {
  /// Returns a callable class that can be used as follows: `instanceOfAccountState.copyWith(...)` or like so:`instanceOfAccountState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountStateCWProxy get copyWith => _$AccountStateCWProxyImpl(this);
}
