import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/widgets/home_appbar.dart';
import 'package:flutter_application_1/pages/home/widgets/home_bottom.dart';
import 'package:flutter_application_1/routers/router.gr.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(       
      routes: const [          
        HomeRoute(),
        ExploreRoute(),
        CartRoute(),
        OfferRoute(),
        AccountRoute()
      ],          
      builder: (context, child, animation) {   
        final tabsRouter = AutoTabsRouter.of(context);      
        return Scaffold(       
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: FadeTransition(          
                    opacity: animation,       
                    child: child,          
                  ),
                ),
                HomeBottom(tabsRouter: tabsRouter,)
              ],
            ),
          ),          
          // bottomNavigationBar: HomeBottom(tabsRouter: tabsRouter,)
        );          
      },          
    );          
  }
}