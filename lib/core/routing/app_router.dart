import 'package:flutter/material.dart';
import 'package:shopx/features/auth/login/login_screen.dart';
import 'package:shopx/features/auth/register/screens/register_screen.dart';
import 'package:shopx/features/home/best_selling/screens/best_selling_screen.dart';
import 'package:shopx/features/home/home/screens/home_screen.dart';
import 'package:shopx/features/root_screen.dart';
import 'package:shopx/features/search/screens/search_screen.dart';
import 'routes.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch(settings.name)
    {
      case Routes.rootScreen:
        return MaterialPageRoute(
            builder: (_) => const RootScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
        );
      case Routes.bestSellingScreen:
        return MaterialPageRoute(
          builder: (_) => const BestSellingScreen(),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
            builder: (_) => const SearchScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
    }
    return null;
  }
}