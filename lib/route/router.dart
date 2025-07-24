
import 'package:base_project/route/routers_destination.dart';
import 'package:base_project/ui/home/home_screen.dart';
import 'package:base_project/ui/home/home_viewmodel.dart';
import 'package:base_project/ui/login/login_screen.dart';
import 'package:base_project/ui/login/login_viewmodel.dart';
import 'package:base_project/ui/responsive/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/repository/data_repository.dart';
import '../ui/responsive/data.dart' as data;
import '../utils/Result.dart';

GoRouter route() => GoRouter(
   initialLocation: RoutersDestination.home,
   // redirect: _redirect,
   debugLogDiagnostics: true,
   routes: [
      GoRoute(path: RoutersDestination.home,
      builder: (context, state) {
        return ResponsiveScreen(currentUser: data.user_0);
        // return  HomeScreen(viewModel: HomeViewModel(context.read()));
      },),
      GoRoute(path: RoutersDestination.login,
      builder: (context, state) {
        return LoginScreen(viewModel: LoginViewModel(dataRepository: context.read()));
      },)
   ]

);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
   final result = await context.read<DataRepository>().isAuthenticated();
   switch (result) {
      case Success<bool>():
         if (!result.value) {
            return RoutersDestination.login;
         } else {
            return RoutersDestination.home;
         }
      case Failure<bool>():
         return RoutersDestination.login;
   }

}