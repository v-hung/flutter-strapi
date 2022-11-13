// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/auth/layout.dart' as _i2;
import '../pages/auth/login.dart' as _i3;
import '../pages/home.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    AuthLayout.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthLayout(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          AuthLayout.name,
          path: '/auth',
          children: [
            _i4.RouteConfig(
              '#redirect',
              path: '',
              parent: AuthLayout.name,
              redirectTo: 'login',
              fullMatch: true,
            ),
            _i4.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthLayout.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.AuthLayout]
class AuthLayout extends _i4.PageRouteInfo<void> {
  const AuthLayout({List<_i4.PageRouteInfo>? children})
      : super(
          AuthLayout.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthLayout';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}
