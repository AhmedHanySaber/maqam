import 'package:flutter/material.dart';

class ImageViwer extends StatelessWidget {
  final List<String> image;
  const ImageViwer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) { return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width ,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/t3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
          },

        ),
      ),
    );
  }
}