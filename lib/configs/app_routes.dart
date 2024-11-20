import 'package:flutter/material.dart';
import '../screens/login/login_screen.dart';
import '../screens/main/main_screen.dart';

class AppRoutes {
  // Route names
  static const String login = '/login';
  static const String main = '/main';
  static const String home = '/home';
  static const String card = '/card';
  static const String profile = '/profile';

  // Routes map
  static final Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    main: (context) => const MainScreen(),
    // These screens are typically accessed through the BottomNavigationBar
    // on the MainScreen, but you can add individual routes if needed:
    // home: (context) => const HomeScreen(),
    // card: (context) => const CardScreen(),
    // profile: (context) => const ProfileScreen(),
  };
}
