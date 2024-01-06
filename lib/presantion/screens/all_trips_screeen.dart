import 'package:flutter/material.dart';

import '../widgets/all_trips_widget.dart';
import '../widgets/trip_widget.dart';

class AllTripsScreen extends StatelessWidget {
  const AllTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text('All Trips'),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 9,
            mainAxisSpacing: 10,
          ),
          itemCount: 60, // Adjust the number of items based on your data
          itemBuilder: (context, index) {
            return Center(
              child: GestureDetector(
                onTap: ()
                {
                  Navigator.pushNamed(context, '/details_screen');
                },

                child: TripWidget2(
                  image: 'assets/images/t3.jpg',
                  location: 'Cairo',
                  title: 'Trip $index', // Replace with actual location data
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
