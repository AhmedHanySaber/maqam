import 'package:flutter/material.dart';

import '../../constants.dart';
import '../widgets/location_widget.dart';
import '../widgets/trips.dart';
import 'all_trips_screeen.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
              children: [

            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Locations',
                    style: TextStyle(
                      color: Green,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                    },
                    child: const Text('See All',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40, // Set a specific height here
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    child: locationWidget(
                      image: 'assets/images/img1.png',
                      location: 'cairo ',
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Trips',
                    style: TextStyle(
                      color: Green,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllTripsScreen(),
                        ),
                      );
                    },
                    child: const Text('See All',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        )),
                  )
                ],
              ),
            ),
            const trips(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended Trips',
                    style: TextStyle(
                      color: Green,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllTripsScreen(),
                        ),
                      );
                    },
                    child: const Text('See All',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        )),
                  )
                ],
              ),
            ),
            const trips(),
          ]))
    ]);
  }
}
