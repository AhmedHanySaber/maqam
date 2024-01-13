
import 'package:flutter/material.dart';
import 'package:maqam/presantion/screens/see_all_location.dart';
import 'package:maqam/presantion/screens/test.dart';

import '../../constants.dart';
import '../../data/models/trip_model.dart';
import '../../data/repo/TripRepository.dart';
import '../../data/repo/locationRepo.dart';
import '../widgets/location_widget.dart';
import '../widgets/trips.dart';


import 'all_trips_screeen.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Trip>>(
      future: TripRepository().getTrips(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<Trip> tripes = snapshot.data!;
            return ListView(
                children: [
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

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Test() ,//SeeAllLocationScreen(),
                                        ),
                                      );
                                    },
                                    child: GestureDetector(
                                      child: const Text('See All',
                                          style: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40, // Set a specific height here
                              child: FutureBuilder(
                                future: LocationRepository().getLocations(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () async {
                                            var list = await TripRepository().flitreTrips(tripes, snapshot.data![index].location);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => AllTripsScreen(trips: list),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                            child: locationWidget(
                                              image: 'assets/images/img1.png',
                                              location:snapshot.data![index].location,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
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
                                          builder: (context) =>  AllTripsScreen(trips:tripes,),
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
                             trips(tripes:tripes,),
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
                                          builder: (context) => AllTripsScreen(trips: tripes,),
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
                             trips(tripes:tripes ,),
                          ]))
                ])

            ;
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
/*

* */