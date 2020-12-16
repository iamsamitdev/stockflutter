import 'package:flutter/material.dart';
import 'package:stockflutter/screens/dashboard/dashboard_screen.dart';
import 'package:stockflutter/screens/drawermenu/about/about_screen.dart';
import 'package:stockflutter/screens/drawermenu/contact/contact_screen.dart';
import 'package:stockflutter/screens/drawermenu/termpolicy/termpolicy_screen.dart';
import 'package:stockflutter/screens/login/login_screen.dart';
import 'package:stockflutter/screens/onboarding/onboarding_screen.dart';

// สร้างตัวแปรแบบ Map ไว้เก็บ URL และ Screen
Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/onboarding":(BuildContext context) => OnboardingScreen(),
  "/login":(BuildContext context) => LoginScreen(),
  "/dashboard":(BuildContext context) => DashboardScreen(),
  "/about":(BuildContext context) => AboutScreen(),
  "/termpolicy":(BuildContext context) => TermPolicyScreen(),
  "/contact":(BuildContext context) => ContactScreen()
};