import 'package:upfood_restaurant/src/data/firestoreAPI.dart';

class RestaurantRepository {
  final _firestoreAPI = FirestoreAPI();

  Future<bool> authenticateRestaurant(String email, String password) =>
      _firestoreAPI.authenticateRestaurant(email, password);
}