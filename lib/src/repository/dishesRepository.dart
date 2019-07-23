import 'package:upfood_restaurant/src/data/firestoreAPI.dart';
import 'package:upfood_restaurant/src/model/dishDTO.dart';

class Repository {
  final _firestoreAPI = FirestoreAPI();

  Future<void> registerDish(
          String name,
          String description,
          String restaurantName,
          String imgUrl,
          double rating,
          int reviews,
          int price,
          int offerPrice,
          bool isInOffer,
          bool isEnabled) =>
      _firestoreAPI.registerDish(name, description, restaurantName, imgUrl,
          rating, reviews, price, offerPrice, isInOffer, isEnabled);

  Future<void> updateDish(
          String id,
          String name,
          String description,
          String restaurantName,
          String imgUrl,
          double rating,
          int reviews,
          int price,
          int offerPrice,
          bool isInOffer,
          bool isEnabled) =>
      _firestoreAPI.updateDish(id, name, description, restaurantName,
          imgUrl, rating, reviews, price, offerPrice, isInOffer, isEnabled);

  Stream<Dish> getDish(String id) =>
      _firestoreAPI.getDish(id).map((snapshot) {
        String id = snapshot.documentID;
        String name = snapshot.data['name'];
        String description = snapshot.data['description'];
        String restaurantName = snapshot.data['restaurant'];
        String imgUrl = snapshot.data['imgUrl'];
        double rating = snapshot.data['rating'];
        int reviews = snapshot.data['reviews'];
        int price = snapshot.data['price'];
        int offerPrice = snapshot.data['offerPrice'];
        bool isInOffer = snapshot.data['isInOffer'];
        bool isEnabled = snapshot.data['isEnabled'];

        return Dish(id, name, description, restaurantName, imgUrl, rating,
            reviews, price, offerPrice, isInOffer, isEnabled);
      });

  Stream<List<Dish>> getDishes(String restaurantName) =>
      _firestoreAPI.getDishesList(restaurantName).map((snapshot) {
        print('Se encontraron: ' + snapshot.documents.length.toString());
        List<Dish> dishesList = [];
        snapshot.documents.toList().forEach((document) {
          String id = document.documentID;
          String name = document.data['name'];
          print(document.data['name']);
          String description = document.data['description'];
          print(document.data['description']);
          String restaurantName = document.data['restaurant'];
          print(document.data['restaurant']);
          String imgUrl = document.data['imgUrl'];
          print(document.data['imgUrl']);
          double rating = document.data['rating'].toDouble();
          print(document.data['rating']);
          int reviews = document.data['reviews'];
          print(document.data['reviews']);
          int price = document.data['price'];
          print(document.data['price']);
          int offerPrice = document.data['offerPrice'];
          print(document.data['offerPrice']);
          bool isInOffer = document.data['isInOffer'];
          bool isEnabled = document.data['isEnabled'];

          Dish dish = Dish(id, name, description, restaurantName, imgUrl,
              rating, reviews, price, offerPrice, isInOffer, isEnabled);
          dishesList.add(dish);
        });

        return dishesList;
      });
}
