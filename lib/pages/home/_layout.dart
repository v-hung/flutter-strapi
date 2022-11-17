import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/page.dart';
import 'package:flutter_application_1/pages/home/widgets/home_appbar.dart';
import 'package:flutter_application_1/pages/home/widgets/home_bottom.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(       
      routes: const [          
        HomePage(),
      ],          
      builder: (context, child, animation) {   
        final tabsRouter = AutoTabsRouter.of(context);      
        return Scaffold(
          appBar: const HomeAppbar(),          
          body: FadeTransition(          
            opacity: animation,       
            child: SafeArea(child: child),          
          ),          
          bottomNavigationBar: HomeBottom()
        );          
      },          
    );          
  }
}