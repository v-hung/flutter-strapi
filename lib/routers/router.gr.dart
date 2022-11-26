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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i13;

import '../middleware/auth.dart' as _i14;
import '../pages/auth/_layout.dart' as _i3;
import '../pages/auth/login.dart' as _i10;
import '../pages/auth/register.dart' as _i11;
import '../pages/home/_layout.dart' as _i1;
import '../pages/home/account/page.dart' as _i8;
import '../pages/home/cart/page.dart' as _i6;
import '../pages/home/explore/page.dart' as _i5;
import '../pages/home/offer/page.dart' as _i7;
import '../pages/home/page.dart' as _i4;
import '../pages/product/%5Bslug%5D/page.dart' as _i9;

class AppRouter extends _i12.RootStackRouter {
  AppRouter({
    _i13.GlobalKey<_i13.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i14.AuthGuard authGuard;

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    HomeLayout.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeLayout(),
      );
    },
    EmptyRouterRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    AuthLayout.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AuthLayout(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    ExploreRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ExplorePage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.CartPage(),
      );
    },
    OfferRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.OfferPage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AccountPage(),
      );
    },
    ProductDetailLayout.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailLayoutArgs>(
          orElse: () =>
              ProductDetailLayoutArgs(slug: pathParams.getString('slug')));
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.ProductDetailLayout(
          key: args.key,
          slug: args.slug,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.RegisterPage(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          HomeLayout.name,
          path: '/',
          guards: [authGuard],
          children: [
            _i12.RouteConfig(
              HomeRoute.name,
              path: '',
              parent: HomeLayout.name,
            ),
            _i12.RouteConfig(
              ExploreRoute.name,
              path: 'explore',
              parent: HomeLayout.name,
            ),
            _i12.RouteConfig(
              CartRoute.name,
              path: 'cart',
              parent: HomeLayout.name,
            ),
            _i12.RouteConfig(
              OfferRoute.name,
              path: 'offer',
              parent: HomeLayout.name,
            ),
            _i12.RouteConfig(
              AccountRoute.name,
              path: 'account',
              parent: HomeLayout.name,
            ),
          ],
        ),
        _i12.RouteConfig(
          EmptyRouterRoute.name,
          path: '/products',
          guards: [authGuard],
          children: [
            _i12.RouteConfig(
              ProductDetailLayout.name,
              path: ':slug',
              parent: EmptyRouterRoute.name,
            )
          ],
        ),
        _i12.RouteConfig(
          AuthLayout.name,
          path: '/auth',
          children: [
            _i12.RouteConfig(
              '#redirect',
              path: '',
              parent: AuthLayout.name,
              redirectTo: 'login',
              fullMatch: true,
            ),
            _i12.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthLayout.name,
            ),
            _i12.RouteConfig(
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
class HomeLayout extends _i12.PageRouteInfo<void> {
  const HomeLayout({List<_i12.PageRouteInfo>? children})
      : super(
          HomeLayout.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeLayout';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EmptyRouterRoute extends _i12.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          path: '/products',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i3.AuthLayout]
class AuthLayout extends _i12.PageRouteInfo<void> {
  const AuthLayout({List<_i12.PageRouteInfo>? children})
      : super(
          AuthLayout.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthLayout';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.ExplorePage]
class ExploreRoute extends _i12.PageRouteInfo<void> {
  const ExploreRoute()
      : super(
          ExploreRoute.name,
          path: 'explore',
        );

  static const String name = 'ExploreRoute';
}

/// generated route for
/// [_i6.CartPage]
class CartRoute extends _i12.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: 'cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i7.OfferPage]
class OfferRoute extends _i12.PageRouteInfo<void> {
  const OfferRoute()
      : super(
          OfferRoute.name,
          path: 'offer',
        );

  static const String name = 'OfferRoute';
}

/// generated route for
/// [_i8.AccountPage]
class AccountRoute extends _i12.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: 'account',
        );

  static const String name = 'AccountRoute';
}

/// generated route for
/// [_i9.ProductDetailLayout]
class ProductDetailLayout extends _i12.PageRouteInfo<ProductDetailLayoutArgs> {
  ProductDetailLayout({
    _i13.Key? key,
    required String slug,
  }) : super(
          ProductDetailLayout.name,
          path: ':slug',
          args: ProductDetailLayoutArgs(
            key: key,
            slug: slug,
          ),
          rawPathParams: {'slug': slug},
        );

  static const String name = 'ProductDetailLayout';
}

class ProductDetailLayoutArgs {
  const ProductDetailLayoutArgs({
    this.key,
    required this.slug,
  });

  final _i13.Key? key;

  final String slug;

  @override
  String toString() {
    return 'ProductDetailLayoutArgs{key: $key, slug: $slug}';
  }
}

/// generated route for
/// [_i10.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i11.RegisterPage]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterRoute';
}
