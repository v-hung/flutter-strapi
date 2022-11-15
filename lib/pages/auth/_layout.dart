// import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routers/router.gr.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          // child: AutoRouter()
          child: AutoTabsRouter(
            routes: const [
              LoginRoute(),
              RegisterRoute()
            ],
            builder: (context, child, animation) {
              return child;
            }
          ),
        ),
      )
    );
  }
}