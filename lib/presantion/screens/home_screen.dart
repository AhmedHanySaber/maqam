import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:maqam/constants.dart';
import 'package:maqam/presantion/screens/profile_screen.dart';
import 'package:maqam/presantion/screens/trips_screen.dart';

import '../widgets/all_trips_widget.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const TripsScreen(),
    ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray,
      body: _widgetOptions[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: gray,
        color: Green,
        items: const <Widget>[
          Icon(Icons.home, color: Colors.white, size: 30),
          Icon(Icons.chat_bubble, color: Colors.white, size: 30),
          Icon(Icons.person, color: Colors.white, size: 30),
        ],
        onTap: (index) {
          //Handle button tap

          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}
