import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upfood_restaurant/src/data/firestoreAPI.dart';

class Repository {

  final _firestoreProvider = FirestoreProvider();

  Future<int> authenticateUser(String email, String password) =>
      _firestoreProvider.authenticateUser(email, password);

  Future<void> registerDish(String name, String description, String restaurantName, int price, int offerPrice) =>
      _firestoreProvider.registerDish(name, description, restaurantName, price, offerPrice);

  Future<void> updateDish(String id, String name, String description, int price, int offerPrice) =>
      _firestoreProvider.updateDish(id, name, description, price, offerPrice);

  Stream<DocumentSnapshot> getDish(String id) =>
      _firestoreProvider.getDish(id);

  Stream<QuerySnapshot> getDishesList(String restaurantName) =>
      _firestoreProvider.getDishesList(restaurantName);

}