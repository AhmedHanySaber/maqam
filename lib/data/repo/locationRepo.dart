import 'package:maqam/data/models/location_model.dart';


import '../servies/FirebaseService.dart';


class LocationRepository {
  final FirebaseService _firebaseService = FirebaseService();

  Future<List<Location>> getLocations() async {
    return _firebaseService.getLocations();
  }

// Add methods for other business logic or combining data from multiple sources.
}