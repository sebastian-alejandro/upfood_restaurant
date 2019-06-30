import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/bloc/dishesBloc.dart';
export 'package:upfood_restaurant/src/bloc/dishesBloc.dart';

class DishesBlocProvider extends InheritedWidget {
  final bloc = DishesBloc();

  DishesBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static DishesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(DishesBlocProvider) as DishesBlocProvider).bloc;
  }
}