import 'package:upfood_restaurant/src/data/firestoreAPI.dart';
import 'package:upfood_restaurant/src/model/userDTO.dart';

class UserRepository {
  final _firestoreAPI = FirestoreAPI();

  Future<bool> authenticateUser(String email, String password) =>
      _firestoreAPI.authenticateUser(email, password);

  Future<void> registerUser(
    String id,
    String name,
    String lastName,
    String email,
    String password,
    int followersCount,
    int followingCount,
    int reviews,
    bool isEnabled,
  ) =>
      _firestoreAPI.registerUser(User(id, name, lastName, email, password,
          followersCount, followingCount, reviews, isEnabled));
}
