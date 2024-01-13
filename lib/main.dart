
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maqam/presantion/screens/home_screen.dart';
import 'package:maqam/presantion/screens/test.dart';
import 'package:maqam/presantion/screens/trips_screen.dart';
import 'package:maqam/routes/app_routes.dart';

import 'firebase_options.dart';

Future<void> main()   async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      // initialRoute: AppRoutes.loginScreen,

home: HomeScreen(),
      

    );
  }
}
