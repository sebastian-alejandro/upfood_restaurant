import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/model/dishDTO.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:upfood_restaurant/src/repository/dishesRepository.dart';

void main () {
  test('Convert snapshots of dishes in list of dishes', () {
    final _repository = Repository();

    Stream<List<Dish>> dishesList = _repository.getDishes('flordeChile');

    });
}