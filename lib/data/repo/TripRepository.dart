

import '../models/trip_model.dart';
import '../servies/FirebaseService.dart';

class TripRepository {
  final FirebaseService _firebaseService = FirebaseService();

  Future<List<Trip>> getTrips() async {
    return _firebaseService.getTrips();
  }
List<Trip> flitreTrips(List<Trip> trips,String location)
{
  List<Trip> flitreTrips=[];
  for(int i=0;i<trips.length;i++)
  {
    if(trips[i].location==location)
    {
      flitreTrips.add(trips[i]);
    }
  }
  return flitreTrips;
}
// Add methods for other business logic or combining data from multiple sources.
}
