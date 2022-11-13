import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_1/pages/auth/layout.dart';
import 'package:flutter_application_1/pages/auth/login.dart';
import 'package:flutter_application_1/pages/home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/', page: HomePage),
    AutoRoute(
      path: '/auth',
      page: AuthLayout,
      children: [
        RedirectRoute(path: '', redirectTo: 'login'),
        AutoRoute(path: 'login', page: LoginPage),   
      ]
    )
  ]
)

class $AppRouter {
  
}