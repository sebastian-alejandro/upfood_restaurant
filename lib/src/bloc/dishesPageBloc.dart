import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:upfood_restaurant/src/repository/dishesRepository.dart';
import 'package:upfood_restaurant/src/model/dishDTO.dart';


class DishesPageBloc {

  final _repository = Repository();
  final _name = BehaviorSubject<String>();
  final _description = BehaviorSubject<String>();
  final _restaurantName = BehaviorSubject<String>();
  final _price = BehaviorSubject<int>();
  final _offerPrice = BehaviorSubject<int>();
  final _showProgress = BehaviorSubject<bool>();

  Observable<String> get name => _name.stream;
  Observable<String> get description => _description.stream;
  Observable<String> get restaurantName => _restaurantName.stream;
  Observable<int> get price => _price.stream;
  Observable<int> get offerPrice => _offerPrice.stream;
  Observable<bool> get showProgress => _showProgress.stream;

  Stream<QuerySnapshot> dishesList(String restaurantName) {
    return _repository.getDishesList(restaurantName);
  }

  void dispose() async {
    _name.close();
    _description.close();
    _restaurantName.close();
    _price.close();
    _offerPrice.close();
    _showProgress.close();
  }

}