import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_1/middleware/auth.dart';
import 'package:flutter_application_1/pages/auth/_layout.dart';
import 'package:flutter_application_1/pages/auth/login.dart';
import 'package:flutter_application_1/pages/auth/register.dart';
import 'package:flutter_application_1/pages/home/_layout.dart';
import 'package:flutter_application_1/pages/home/page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/', page: HomeLayout, guards: [AuthGuard],
      children: [
        AutoRoute(path: '', page: HomePage, initial: true),   
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