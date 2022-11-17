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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../middleware/auth.dart' as _i8;
import '../pages/auth/_layout.dart' as _i2;
import '../pages/auth/login.dart' as _i4;
import '../pages/auth/register.dart' as _i5;
import '../pages/home/_layout.dart' as _i1;
import '../pages/home/page.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter({
    _i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i8.AuthGuard authGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeLayout.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeLayout(),
      );
    },
    AuthLayout.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthLayout(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomeLayout.name,
          path: '/',
          guards: [authGuard],
          children: [
            _i6.RouteConfig(
              HomeRoute.name,
              path: '',
              parent: HomeLayout.name,
            )
          ],
        ),
        _i6.RouteConfig(
          AuthLayout.name,
          path: '/auth',
          children: [
            _i6.RouteConfig(
              '#redirect',
              path: '',
              parent: AuthLayout.name,
              redirectTo: 'login',
              fullMatch: true,
            ),
            _i6.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthLayout.name,
            ),
            _i6.RouteConfig(
              RegisterRoute.name,
              path: 'register',
              parent: AuthLayout.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.HomeLayout]
class HomeLayout extends _i6.PageRouteInfo<void> {
  const HomeLayout({List<_i6.PageRouteInfo>? children})
      : super(
          HomeLayout.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeLayout';
}

/// generated route for
/// [_i2.AuthLayout]
class AuthLayout extends _i6.PageRouteInfo<void> {
  const AuthLayout({List<_i6.PageRouteInfo>? children})
      : super(
          AuthLayout.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthLayout';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.RegisterPage]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterRoute';
}
