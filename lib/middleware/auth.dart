// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/app/provider/user/user_cubit.dart';

class AuthGuard extends AutoRouteGuard {
    final UserCubit userCubit;
    late StreamSubscription<UserState> authBlocStateSubscription;

    AuthGuard({
        required this.userCubit
    });

    @override          
    void onNavigation(NavigationResolver resolver, StackRouter router) async {          
        // the navigation is paused until resolver.next() is called with either           
        // true to resume/continue navigation or false to abort navigation 
        final context = router.navigatorKey.currentContext;
        // print({context, userCubit.state});
        if (context != null) {
            // print(context.read<UserState>());
        }
        //  if(authenitcated){          
        //    // if user is authenticated we continue          
        //     resolver.next(true);          
        //   }else{          
        //      // we redirect the user to our login page          
        //      router.push(LoginRoute(onResult: (success){          
        //             // if success == true the navigation will be resumed          
        //             // else it will be aborted          
        //            resolver.next(success);          
        //       }));          
        //      }              
        //  }          
        resolver.next(true);  
    }   
}
     