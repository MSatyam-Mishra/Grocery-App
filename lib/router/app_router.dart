import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/onboarding_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/category_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/search_screen.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: 'onboarding',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (BuildContext context, GoRouterState state) {
          return const SignupScreen();
        },
      ),
      GoRoute(
        name: 'category',
        path: '/category',
        builder: (BuildContext context, GoRouterState state) {
          return const CategoryScreen();
        },
      ),
      GoRoute(
        name: 'cart',
        path: '/cart',
        builder: (BuildContext context, GoRouterState state) {
          return const CartScreen();
        },
      ),
      GoRoute(
        name: 'search',
        path: '/search',
        builder: (BuildContext context, GoRouterState state) {
          return const SearchScreen();
        },
      ),
    ],
  );
}
