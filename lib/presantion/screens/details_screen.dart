import 'package:flutter/material.dart';
import 'package:maqam/constants.dart';
import 'package:maqam/presantion/widgets/image_view%20widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Lake',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: ClipRRect(
                        child: ImageViwer(
                          image: ['assets/images/t3.jpg','assets/images/t3.jpg','assets/images/t3.jpg','assets/images/t3.jpg',],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Redfish Lake",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(
                          "Idaho",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 22),
              SizedBox(
                width: 343,
                child: Text(
                  "What is Redfish Lake known for?\nRedfish Lake is the final stop on the longest \nPacific salmon run in North America, which\n requires long-distance swimmers, such as \nSockeye and Chinook Salmon, to travel over \n900 miles upstream to return to their spawning \ngrounds.\nRedfish Lake is an alpine lake in Custer County,\n Idaho, just south of Stanley. It is the largest lake \nwithin the Sawtooth National Recreation Area.",
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),


            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 20,
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Booking Now",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          style: ElevatedButton.styleFrom(
            primary: Green,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

          ),
        ),
      ),
    );
  }
}
