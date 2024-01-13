import 'package:flutter/material.dart';
import 'package:maqam/presantion/screens/login_screen.dart';

import '../presantion/screens/details_screen.dart';
import '../presantion/screens/sign_up.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';
  static const String SignUpScreen = '/sign_up';
  static const String HomeScreen = '/home_screen';
  static const String DetalisScreen = '/details_screen';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => const LoginScreen(),
    SignUpScreen : (context) => const SignUp(),


  };
}
