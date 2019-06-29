import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/bloc/dishesPageBloc.dart';
export 'package:upfood_restaurant/src/bloc/dishesPageBloc.dart';

class DishesPageBlocProvider extends InheritedWidget {
  final bloc = DishesPageBloc();

  DishesPageBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static DishesPageBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(DishesPageBlocProvider) as DishesPageBlocProvider).bloc;
  }
}