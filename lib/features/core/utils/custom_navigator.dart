import 'package:flutter/material.dart';
import 'package:tv_series/features/login/presentation/pages/login_screen.dart';
import 'package:tv_series/features/series/presentation/pages/home_screen.dart';

class CustomNavigator {
  static Route<dynamic> routes(RouteSettings settings) {
    final route = settings.name?.split('/');
    if(route != null) {
      switch (route[0]) {
      case CustomRoutes.home:
        return defaultRoute(const HomeScreen());
      case CustomRoutes.login:
        return defaultRoute(const LoginScreen());
     default:
       return defaultRoute(const LoginScreen());
    }
    }
    return defaultRoute(const LoginScreen());
  }
}

MaterialPageRoute defaultRoute<T extends Widget>(T child) {
  return MaterialPageRoute<T>(builder: (BuildContext context) => child);
}

class CustomRoutes {
  static const String home = "home";
  static const String login = "login";
}