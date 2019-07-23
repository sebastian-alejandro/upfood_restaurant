import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upfood_restaurant/src/model/userDTO.dart';

class FirestoreAPI {
  Firestore _firestore = Firestore.instance;

  Future<bool> authenticateUser(String email, String password) async {
    final QuerySnapshot result = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .getDocuments();

    final List<DocumentSnapshot> documents = result.documents;

    if (documents.length == 0 || documents.elementAt(0).data[password] != password) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> registerUser(User user) async {
    return _firestore
        .collection('users')
        .document(user.id)
        .setData({
      'email': user.email,
      'password': user.password,
      'lastName': user.lastName,
      'name': user.name,
      'followersCount': user.followersCount,
      'followingCount': user.followingCount,
      'reviews': user.reviews,
      'isEnabled': user.isEnabled,

    });
  }

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
      bool isEnabled) async {
    return _firestore.collection('dishes').add({
      'name': name,
      'description': description,
      'restaurant': restaurantName,
      'imgUrl': imgUrl,
      'rating': rating,
      'reviews': reviews,
      'price': price,
      'offerPrice': offerPrice,
      'isInOffer': isInOffer,
      'isEnabled': isEnabled,
    });
  }

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
      bool isEnabled) {
    return _firestore.runTransaction((transaction) async {
      DocumentSnapshot freshSnap =
          await transaction.get(_firestore.collection('dishes').document(id));
      await transaction.update(freshSnap.reference, {
        'name': name,
        'description': description,
        'restaurant': restaurantName,
        'imgUrl': imgUrl,
        'rating': rating,
        'reviews': reviews,
        'price': price,
        'offerPrice': offerPrice,
        'isInOffer': isInOffer,
        'isEnabled': isEnabled,
      });
    });
  }

  Stream<DocumentSnapshot> getDish(String id) {
    return _firestore.collection('dishes').document(id).snapshots();
  }

  Stream<QuerySnapshot> getDishesList(String restaurantName) {
    return _firestore
        .collection('dishes')
        .where('restaurant', isEqualTo: restaurantName)
        .snapshots();
  }
}
