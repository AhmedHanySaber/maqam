import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maqam/data/models/location_model.dart';

import '../models/trip_model.dart';

class FirebaseService {
  final CollectionReference _tripsCollection = FirebaseFirestore.instance.collection('trip');
  final CollectionReference _locationsCollection = FirebaseFirestore.instance.collection('locations');

  Future<List<Trip>> getTrips() async {
    QuerySnapshot querySnapshot = await _tripsCollection.get();
    return querySnapshot.docs.map((doc) => Trip.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<List<Location>> getLocations() async {
    QuerySnapshot querySnapshot = await _locationsCollection.get();
    return querySnapshot.docs.map((doc) => Location.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

// Add methods for other CRUD operations (create, update, delete) as needed.
}
