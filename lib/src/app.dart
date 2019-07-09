import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/view/homePage.dart';
import 'package:upfood_restaurant/src/view/userHomePage.dart';
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