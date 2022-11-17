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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../middleware/auth.dart' as _i12;
import '../pages/auth/_layout.dart' as _i2;
import '../pages/auth/login.dart' as _i8;
import '../pages/auth/register.dart' as _i9;
import '../pages/home/_layout.dart' as _i1;
import '../pages/home/account/page.dart' as _i7;
import '../pages/home/cart/page.dart' as _i5;
import '../pages/home/explore/page.dart' as _i4;
import '../pages/home/offer/page.dart' as _i6;
import '../pages/home/page.dart' as _i3;

class AppRouter extends _i10.RootStackRouter {
  AppRouter({
    _i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i12.AuthGuard authGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomeLayout.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeLayout(),
      );
    },
    AuthLayout.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthLayout(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    ExploreRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ExplorePage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CartPage(),
      );
    },
    OfferRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.OfferPage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AccountPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.RegisterPage(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          HomeLayout.name,
          path: '/',
          guards: [authGuard],
          children: [
            _i10.RouteConfig(
              HomeRoute.name,
              path: '',
              parent: HomeLayout.name,
            ),
            _i10.RouteConfig(
              ExploreRoute.name,
              path: 'explore',
              parent: HomeLayout.name,
            ),
            _i10.RouteConfig(
              CartRoute.name,
              path: 'cart',
              parent: HomeLayout.name,
            ),
            _i10.RouteConfig(
              OfferRoute.name,
              path: 'offer',
              parent: HomeLayout.name,
            ),
            _i10.RouteConfig(
              AccountRoute.name,
              path: 'account',
              parent: HomeLayout.name,
            ),
          ],
        ),
        _i10.RouteConfig(
          AuthLayout.name,
          path: '/auth',
          children: [
            _i10.RouteConfig(
              '#redirect',
              path: '',
              parent: AuthLayout.name,
              redirectTo: 'login',
              fullMatch: true,
            ),
            _i10.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthLayout.name,
            ),
            _i10.RouteConfig(
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
class HomeLayout extends _i10.PageRouteInfo<void> {
  const HomeLayout({List<_i10.PageRouteInfo>? children})
      : super(
          HomeLayout.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeLayout';
}

/// generated route for
/// [_i2.AuthLayout]
class AuthLayout extends _i10.PageRouteInfo<void> {
  const AuthLayout({List<_i10.PageRouteInfo>? children})
      : super(
          AuthLayout.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthLayout';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ExplorePage]
class ExploreRoute extends _i10.PageRouteInfo<void> {
  const ExploreRoute()
      : super(
          ExploreRoute.name,
          path: 'explore',
        );

  static const String name = 'ExploreRoute';
}

/// generated route for
/// [_i5.CartPage]
class CartRoute extends _i10.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: 'cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i6.OfferPage]
class OfferRoute extends _i10.PageRouteInfo<void> {
  const OfferRoute()
      : super(
          OfferRoute.name,
          path: 'offer',
        );

  static const String name = 'OfferRoute';
}

/// generated route for
/// [_i7.AccountPage]
class AccountRoute extends _i10.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: 'account',
        );

  static const String name = 'AccountRoute';
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i9.RegisterPage]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterRoute';
}
