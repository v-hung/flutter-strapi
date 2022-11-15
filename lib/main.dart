import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/provider/user/user_cubit.dart';
import 'package:flutter_application_1/pages/home/page.dart';
import 'package:flutter_application_1/routers/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/provider/counter/counter_cubit.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        scrollBehavior: AppScrollBehavior(),
        title: 'My app',
        routerDelegate: _appRouter.delegate(),      
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}