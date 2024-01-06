import 'package:flutter/material.dart';
import 'package:maqam/presantion/widgets/trip_widget.dart';

class trips extends StatelessWidget {
  const trips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210, // Set a specific height here
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/details_screen');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child: TripWidget1(
                title: 'trip 1',
                image: 'assets/images/t3.jpg',
                location: 'cairo fsadsdfsdfsdf',
              ),
            ),
          );
        },
      ),
    );
  }
}