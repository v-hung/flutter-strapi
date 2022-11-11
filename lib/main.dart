import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/weather_search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'cubit/counter_cubit.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: WeatherSearch(),
      ),
    );
  }
}