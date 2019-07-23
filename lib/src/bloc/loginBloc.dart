import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:upfood_restaurant/src/repository/usersRepository.dart';
import 'package:upfood_restaurant/src/model/userDTO.dart';

class LoginBloc {
  final _repository = UserRepository();

  Future<bool> authenticate(String email, String password) {
    return _repository.authenticateUser(email, password);
  }

}