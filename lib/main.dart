
import 'package:flutter/material.dart';
import 'package:maqam/presantion/screens/all_trips_screeen.dart';
import 'package:maqam/presantion/screens/details_screen.dart';
import 'package:maqam/presantion/widgets/all_trips_widget.dart';
import 'package:maqam/routes/app_routes.dart';

void main()   {

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
      initialRoute: AppRoutes.loginScreen,

      

    );
  }
}
