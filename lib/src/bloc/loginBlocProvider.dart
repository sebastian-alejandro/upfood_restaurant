import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/bloc/loginBloc.dart';
export 'package:upfood_restaurant/src/bloc/loginBloc.dart';

class LoginBlocProvider extends InheritedWidget {
  final bloc = LoginBloc();

  LoginBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LoginBlocProvider) as LoginBlocProvider).bloc;
  }
}