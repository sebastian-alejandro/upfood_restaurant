import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upfood_restaurant/src/data/firestoreAPI.dart';
import 'package:upfood_restaurant/src/model/dishDTO.dart';

class Repository {

  final _firestoreProvider = FirestoreProvider();

  Future<int> authenticateUser(String email, String password) =>
      _firestoreProvider.authenticateUser(email, password);

  Future<void> registerDish(String name, String description, String restaurantName, int price, int offerPrice) =>
      _firestoreProvider.registerDish(name, description, restaurantName, price, offerPrice);

  Future<void> updateDish(String id, String name, String description, int price, int offerPrice) =>
      _firestoreProvider.updateDish(id, name, description, price, offerPrice);

  Stream<Dish> getDish(String id) =>
      _firestoreProvider.getDish(id).map((snapshot) {
        String id = snapshot.documentID;
        String name = snapshot.data['name'];
        String description = snapshot.data['description'];
        String restaurantName = snapshot.data['restaurant'];
        int price = snapshot.data['price'];
        int offerPrice = snapshot.data['offerPrice'];

        return Dish(id, name, description, restaurantName, price, offerPrice);
      });

  Stream<List<Dish>> getDishes(String restaurantName) =>
      _firestoreProvider.getDishesList(restaurantName).map((snapshot) {

        List<Dish> dishesList = [];
        snapshot.documents.toList().forEach((document) {

          String id = document.documentID;
          String name = document.data['name'];
          String description = document.data['description'];
          String restaurantName = document.data['restaurant'];
          int price = document.data['price'];
          int offerPrice = document.data['offerPrice'];

          Dish dish = Dish(id, name, description, restaurantName, price, offerPrice);
          dishesList.add(dish);

        });

        return dishesList;
      });

}