import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:upfood_restaurant/src/repository/usersRepository.dart';
import 'package:upfood_restaurant/src/repository/restaurantRepository.dart';
import 'package:upfood_restaurant/src/model/userDTO.dart';

class LoginBloc {
  final _repositoryUser = UserRepository();
  final _repositoryRestaurant = RestaurantRepository();

  Future<bool> authenticateUser(String email, String password) {
    return _repositoryUser.authenticateUser(email, password);
  }

  Future<bool> authenticateRestaurant(String email, String password) {
    return _repositoryRestaurant.authenticateRestaurant(email, password);
  }

  void dispose() async {

  }

}