import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/view/restaurantPage.dart';
import 'package:upfood_restaurant/src/view/userPage.dart';
import 'package:upfood_restaurant/src/view/loginAux.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginAux(),
    );
  }
}