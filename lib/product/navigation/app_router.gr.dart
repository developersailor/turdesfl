// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:turdes/features/aidrequest/view/aidrequest_screen.dart' as _i1;
import 'package:turdes/features/home/view/home_screen.dart' as _i2;
import 'package:turdes/features/login/view/login_screen.dart' as _i3;

/// generated route for
/// [_i1.AidrequestsScreen]
class AidrequestsRoute extends _i4.PageRouteInfo<void> {
  const AidrequestsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AidrequestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AidrequestsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AidrequestsScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}
