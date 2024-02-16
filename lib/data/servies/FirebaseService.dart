import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maqam/data/models/location_model.dart';
import 'package:maqam/data/models/user_model.dart';

import '../models/trip_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final CollectionReference _tripsCollection =
  FirebaseFirestore.instance.collection('trip');
  final CollectionReference _locationsCollection =
  FirebaseFirestore.instance.collection('locations');
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('user');

  // Future<List<Trip>> getTrips() async {
  //   QuerySnapshot querySnapshot = await _tripsCollection.get();
  //   return querySnapshot.docs.map((doc) => Trip.fromJson(doc.data())).toList();
  // }

  Future<UserCredential?> createAccount({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      // getting object from the user model
      UserModel user = UserModel(
          fullName: fullName,
          email: email,
          password: password,
          uid: _firebaseAuth.currentUser!.uid);

      // stores the user data in firebase firestore docs
      await _usersCollection
          .doc(_firebaseAuth.currentUser!.uid)
          .set(user.toMap());

      return credential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<UserModel?> getCurrentUserData() async {
    try {
      final user = await FirebaseFirestore.instance
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      final userData = UserModel.fromMap(user.data()!);
      return userData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel?> getUserDataById({required String userId}) async {
    try {
      final user = await FirebaseFirestore.instance.doc(userId).get();

      final userData = UserModel.fromMap(user.data()!);
      return userData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> saveInCart({required Trip trip}) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart")
          .doc("${trip.name}&${trip.location}")
          .set(trip.toMap());
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeFromCart({required Trip trip}) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart")
          .doc("${trip.name}&${trip.location}")
          .delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Trip>> getCartItems() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart")
          .get();

      final tripList =
      data.docs.map((doc) => Trip.fromMap(doc.data())).toList();
      return tripList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Stream<Iterable<Trip>> streamTrips() {
    final controller = StreamController<Iterable<Trip>>();

    final sub = FirebaseFirestore.instance
        .collection("trip")
        .snapshots()
        .listen((snapshot) {
      final trips = snapshot.docs.map(
            (tripData) => Trip.fromMap(
          tripData.data(),
        ),
      );
      controller.sink.add(trips);
    });

    controller.onCancel = () {
      sub.cancel();
      controller.close();
    };

    return controller.stream;
  }

  Stream<Iterable<Trip>> streamTripsByName({required String name}) {
    final controller = StreamController<Iterable<Trip>>();

    final sub = FirebaseFirestore.instance
        .collection("trip")
        .where("name", isGreaterThanOrEqualTo: name)
        .where("name", isLessThanOrEqualTo: "$name\uf8ff")
        .snapshots()
        .listen((snapshot) {
      final trips = snapshot.docs.map(
            (tripData) => Trip.fromMap(
          tripData.data(),
        ),
      );
      controller.sink.add(trips);
    });

    controller.onCancel = () {
      sub.cancel();
      controller.close();
    };

    return controller.stream;
  }

  Future<List<Location>> getLocations() async {
    QuerySnapshot querySnapshot = await _locationsCollection.get();
    return querySnapshot.docs
        .map((doc) => Location.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

// Add methods for other CRUD operations (create, update, delete) as needed.
}
