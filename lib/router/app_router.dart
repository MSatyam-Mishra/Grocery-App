import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/onboarding_screen.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      // GoRoute(
      //   name: 'login',
      //   path: '/login',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const LoginScreen();
      //   },
      // ),
      // GoRoute(
      //   name: 'signup',
      //   path: '/signup',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SignupScreen();
      //   },
      // ),
      // GoRoute(
      //   name: 'category',
      //   path: '/category',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const CategoryScreen();
      //   },
      // ),
      // GoRoute(
      //   name: 'cart',
      //   path: '/cart',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const CartScreen();
      //   },
      // ),
      // GoRoute(
      //   name: 'search',
      //   path: '/search',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SearchScreen();
      //   },
      // ),
    ],
  );
}
