// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:turdes/features/aidrequest/view/aidrequest_screen.dart' as _i1;
import 'package:turdes/features/home/view/home_screen.dart' as _i2;
import 'package:turdes/features/login/view/login_screen.dart' as _i3;
import 'package:turdes/features/register/view/register_screen.dart' as _i4;

/// generated route for
/// [_i1.AidrequestsScreen]
class AidrequestsRoute extends _i5.PageRouteInfo<void> {
  const AidrequestsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AidrequestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AidrequestsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AidrequestsScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i5.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i4.RegisterScreen(key: args.key);
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}
