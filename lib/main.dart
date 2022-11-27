import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/provider/cart/cart_cubit.dart';
import 'package:flutter_application_1/app/provider/user/user_cubit.dart';
import 'package:flutter_application_1/middleware/auth.dart';
import 'package:flutter_application_1/pages/home/page.dart';
import 'package:flutter_application_1/routers/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit()..logged(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
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
    return BlocListener<UserCubit, UserState>(
      listenWhen: (previousState, state) {
        if (state is UserLoaded) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is UserLoaded) {
          context.read<CartCubit>().loadData(state.user);
        }
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.grey[700]
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.grey[700]
          )
        ),
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