import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/view/dashboardPage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}