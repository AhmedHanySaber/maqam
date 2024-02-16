

import '../models/trip_model.dart';
import '../servies/FirebaseService.dart';

class TripRepository {
  final FirebaseService _firebaseService = FirebaseService();

  Stream<Iterable<Trip>> getTrips() {
    return _firebaseService.streamTrips();
  }
  Stream<Iterable<Trip>> getTripsByName({required String name}) {
    return _firebaseService.streamTripsByName(name: name);
  }

  Future<void> addToCart(Trip trip) async {
    await FirebaseService().saveInCart(trip: trip);
  }

  Future<void> removeFromCart(Trip trip) async {
    await FirebaseService().removeFromCart(trip: trip);
  }

  Future<List<Trip>> getCartItems() async {
    final cartItems = await FirebaseService().getCartItems();
    return cartItems;
  }

  List<Trip> flitreTrips(List<Trip> trips, String location) {
    List<Trip> flitreTrips = [];
    for (int i = 0; i < trips.length; i++) {
      if (trips[i].location == location) {
        flitreTrips.add(trips[i]);
      }
    }
    return flitreTrips;
  }
// Add methods for other business logic or combining data from multiple sources.
}
