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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../middleware/auth.dart' as _i7;
import '../pages/auth/_layout.dart' as _i2;
import '../pages/auth/login.dart' as _i3;
import '../pages/auth/register.dart' as _i4;
import '../pages/home/page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter({
    _i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    AuthLayout.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthLayout(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        _i5.RouteConfig(
          AuthLayout.name,
          path: '/auth',
          children: [
            _i5.RouteConfig(
              '#redirect',
              path: '',
              parent: AuthLayout.name,
              redirectTo: 'login',
              fullMatch: true,
            ),
            _i5.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthLayout.name,
            ),
            _i5.RouteConfig(
              RegisterRoute.name,
              path: 'register',
              parent: AuthLayout.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.AuthLayout]
class AuthLayout extends _i5.PageRouteInfo<void> {
  const AuthLayout({List<_i5.PageRouteInfo>? children})
      : super(
          AuthLayout.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthLayout';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegisterPage]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterRoute';
}
