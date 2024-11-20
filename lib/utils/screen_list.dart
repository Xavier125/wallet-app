import 'package:flutter/material.dart';
import '../screens/main/tabs/home_screen.dart';
import '../screens/main/tabs/card_screen.dart';
import '../screens/main/tabs/profile_screen.dart';

final List<Widget> mainScreens = [
  const HomeScreen(),
  const CardScreen(),
  const ProfileScreen(),
];

final List<BottomNavigationBarItem> mainNavItems = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.credit_card),
    label: 'Card',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
  ),
];
