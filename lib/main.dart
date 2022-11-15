import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/provider/user/user_cubit.dart';
import 'package:flutter_application_1/pages/home.dart';
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
        title: 'My app',
        routerDelegate: _appRouter.delegate(),      
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('Counter')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, CounterState>(
            bloc: BlocProvider.of<CounterCubit>(context)..inital(),
            builder: (context, state) {
              return Text(state.counter.toString());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                tooltip: "Decrement",
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                tooltip: "Increment",
                child: Icon(Icons.remove),
              )
            ],
          )
        ],
      ),
    ));
  }
}
