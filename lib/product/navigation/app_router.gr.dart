// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:turdes/features/aidrequest/view/aidrequest_detail_screen.dart'
    as _i1;
import 'package:turdes/features/aidrequest/view/aidrequest_list_screen.dart'
    as _i2;
import 'package:turdes/features/aidrequest/view/aidrequest_screen.dart' as _i3;
import 'package:turdes/features/home/view/home_screen.dart' as _i4;
import 'package:turdes/features/login/view/login_screen.dart' as _i5;
import 'package:turdes/features/profile/view/profile_screen.dart' as _i6;
import 'package:turdes/features/register/view/register_screen.dart' as _i7;

/// generated route for
/// [_i1.AidRequestDetailScreen]
class AidRequestDetailRoute
    extends _i8.PageRouteInfo<AidRequestDetailRouteArgs> {
  AidRequestDetailRoute({
    required int aidRequestId,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AidRequestDetailRoute.name,
          args: AidRequestDetailRouteArgs(
            aidRequestId: aidRequestId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AidRequestDetailRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AidRequestDetailRouteArgs>();
      return _i1.AidRequestDetailScreen(
        aidRequestId: args.aidRequestId,
        key: args.key,
      );
    },
  );
}

class AidRequestDetailRouteArgs {
  const AidRequestDetailRouteArgs({
    required this.aidRequestId,
    this.key,
  });

  final int aidRequestId;

  final _i9.Key? key;

  @override
  String toString() {
    return 'AidRequestDetailRouteArgs{aidRequestId: $aidRequestId, key: $key}';
  }
}

/// generated route for
/// [_i2.AidRequestListScreen]
class AidRequestListRoute extends _i8.PageRouteInfo<void> {
  const AidRequestListRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AidRequestListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AidRequestListRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.AidRequestListScreen();
    },
  );
}

/// generated route for
/// [_i3.AidrequestsScreen]
class AidrequestsRoute extends _i8.PageRouteInfo<void> {
  const AidrequestsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AidrequestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AidrequestsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.AidrequestsScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginScreen();
    },
  );
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterRoute extends _i8.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i7.RegisterScreen(key: args.key);
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}
