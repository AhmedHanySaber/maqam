import 'package:flutter/material.dart';
import 'package:maqam/presantion/screens/details_screen.dart';
import 'package:maqam/presantion/widgets/trip_widget.dart';

import '../../data/models/trip_model.dart';

class trips extends StatelessWidget {
  final List<Trip> tripes;
  const trips({
    super.key, required this.tripes,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210, // Set a specific height here
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tripes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>DetailsScreen(trip: tripes[index]),
                ),
              );
            },
            child:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child: TripWidget1(
                title: tripes[index].name,
                image:  tripes[index].images[0],
                location:  tripes[index].location
              ),
            ),
          );
        },
      ),
    );
  }
}