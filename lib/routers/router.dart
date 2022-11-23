import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter_application_1/middleware/auth.dart';
import 'package:flutter_application_1/pages/auth/_layout.dart';
import 'package:flutter_application_1/pages/auth/login.dart';
import 'package:flutter_application_1/pages/auth/register.dart';
import 'package:flutter_application_1/pages/home/_layout.dart';
import 'package:flutter_application_1/pages/home/account/page.dart';
import 'package:flutter_application_1/pages/home/cart/page.dart';
import 'package:flutter_application_1/pages/home/explore/page.dart';
import 'package:flutter_application_1/pages/home/offer/page.dart';
import 'package:flutter_application_1/pages/home/page.dart';
import 'package:flutter_application_1/pages/product/%5Bslug%5D/page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/', page: HomeLayout, guards: [AuthGuard],
      children: [
        AutoRoute(path: '', page: HomePage),
        AutoRoute(path: 'explore', page: ExplorePage),
        AutoRoute(path: 'cart', page: CartPage),
        AutoRoute(path: 'offer', page: OfferPage),
        AutoRoute(path: 'account', page: AccountPage),
      ]
    ),
    AutoRoute(
      path: '/products', page: EmptyRouterPage, guards: [AuthGuard],
      children: [
        // AutoRoute(path: '', page: EmptyRouterPage),
        AutoRoute(path: ':slug', page: ProductDetailPage),
      ]
    ),
    AutoRoute(
      path: '/auth',
      page: AuthLayout,
      children: [
        RedirectRoute(path: '', redirectTo: 'login'),
        AutoRoute(path: 'login', page: LoginPage),   
        AutoRoute(path: 'register', page: RegisterPage),   
      ]
    )
  ]
)

class $AppRouter {
  
}