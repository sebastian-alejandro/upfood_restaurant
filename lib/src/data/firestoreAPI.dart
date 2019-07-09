import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Future<int> authenticateUser(String email, String password) async {
    final QuerySnapshot result = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .getDocuments();

    final List<DocumentSnapshot> documents = result.documents;

    if (documents.length == 0) {
      return 0;
    } else {
      return 1;
    }
  }

  Future<void> registerDish(
      String name, String description, String restaurantName, int price, int offerPrice) async {
    return _firestore.collection('dishes').add({
      'name': name,
      'description': description,
      'restaurant': restaurantName,
      'price': price,
      'offerPrice': offerPrice
    });
  }

  Future<void> updateDish(
      String id, String name, String description, int price, int offerPrice) {
    return _firestore.runTransaction((transaction) async {
      DocumentSnapshot freshSnap =
          await transaction.get(_firestore.collection('dishes').document(id));
      await transaction.update(freshSnap.reference, {
        'name': name,
        'description': description,
        'price': price,
        'offerPrice': offerPrice
      });
    });
  }

  Stream<DocumentSnapshot> getDish(String id) {
    return _firestore.collection('dishes').document(id).snapshots();
  }

  Stream<QuerySnapshot> getDishesList(String restaurantName) {
    print('Pidiendo Platos a:' + restaurantName);
    return _firestore
        .collection('dishes')
        .where('restaurant', isEqualTo: restaurantName)
        .snapshots();
  }
}
