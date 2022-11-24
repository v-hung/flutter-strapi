import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/provider/user/user_cubit.dart';
import 'package:flutter_application_1/middleware/auth.dart';
import 'package:flutter_application_1/pages/home/page.dart';
import 'package:flutter_application_1/routers/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: MainApp()
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final _appRouter;

  @override
  void initState() {
    final userCubit = BlocProvider.of<UserCubit>(context, listen: false);
    _appRouter = AppRouter(authGuard: AuthGuard(userCubit: userCubit));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.grey[800]
          )
        )
      ),
      scrollBehavior: AppScrollBehavior(),
      title: 'My app',
      routerDelegate: _appRouter.delegate(),      
      routeInformationParser: _appRouter.defaultRouteParser(),
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