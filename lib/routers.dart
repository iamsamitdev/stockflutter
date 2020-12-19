import 'package:flutter/material.dart';
import 'package:stockflutter/screens/addproduct/addproduct_screen.dart';
import 'package:stockflutter/screens/dashboard/dashboard_screen.dart';
import 'package:stockflutter/screens/drawermenu/about/about_screen.dart';
import 'package:stockflutter/screens/drawermenu/contact/contact_screen.dart';
import 'package:stockflutter/screens/drawermenu/termpolicy/termpolicy_screen.dart';
import 'package:stockflutter/screens/editproduct/editproduct_screen.dart';
import 'package:stockflutter/screens/lockscreen/lockscreen.dart';
import 'package:stockflutter/screens/login/login_screen.dart';
import 'package:stockflutter/screens/newsdetail/newsdetail_screen.dart';
import 'package:stockflutter/screens/onboarding/onboarding_screen.dart';
import 'package:stockflutter/screens/register/register_screen.dart';

// สร้างตัวแปรแบบ Map ไว้เก็บ URL และ Screen
Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/onboarding":(BuildContext context) => OnboardingScreen(),
  "/login":(BuildContext context) => LoginScreen(),
  "/register":(BuildContext context) => RegisterScreen(),
  "/lockscreen":(BuildContext context) => LockScreen(),
  "/dashboard":(BuildContext context) => DashboardScreen(),
  "/about":(BuildContext context) => AboutScreen(),
  "/termpolicy":(BuildContext context) => TermPolicyScreen(),
  "/contact":(BuildContext context) => ContactScreen(),
  "/newsdetail":(BuildContext context) => NewsDetailScreen(),
  "/addproduct":(BuildContext context) => AddProductScreen(),
  "/editproduct":(BuildContext context) => EditProductScreen()
};