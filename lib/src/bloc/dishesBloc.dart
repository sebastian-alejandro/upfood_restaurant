import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:upfood_restaurant/src/repository/dishesRepository.dart';
import 'package:upfood_restaurant/src/model/dishDTO.dart';


class DishesBloc {

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


  Stream<List<Dish>> dishesList(String restaurantName) {
    print('Enviando list a la UI');
    return _repository.getDishes(restaurantName);
  }

  Future<void> registerDish(String name, String description, String restaurantName, int price, int offerPrice) {
    return _repository.registerDish(name, description, restaurantName, price, offerPrice);
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