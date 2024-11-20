import 'package:flutter/material.dart';
import 'package:wallet_app/configs/app_colors.dart';
import 'package:wallet_app/configs/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;

    return MaterialApp(
      title: 'Wallet App',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? AppRoutes.main : AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
