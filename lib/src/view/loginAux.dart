import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/view/restaurantPage.dart';
import 'package:upfood_restaurant/src/view/userPage.dart';
class LoginAux extends StatefulWidget {
  @override
  _LoginAuxState createState() => _LoginAuxState();
}

class _LoginAuxState extends State<LoginAux> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 300,
          ),
          ButtonTheme(
            minWidth: 200,
            buttonColor: Colors.transparent,
            child: RaisedButton(
              elevation: 0,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  width: 2,
                  color: Colors.lightBlue,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 16,
                  ),
                  SizedBox(width: 8.26),
                  Text(
                    'Entrar Como Cliente',
                    style: TextStyle(
                        letterSpacing: -0.5,
                        fontFamily: 'YuGothic',
                        fontSize: 12),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPage()),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ButtonTheme(
            minWidth: 200,
            buttonColor: Colors.transparent,
            child: RaisedButton(
              elevation: 0,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  width: 2,
                  color: Colors.lightBlue,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.restaurant_menu,
                    size: 16,
                  ),
                  SizedBox(width: 8.26),
                  Text(
                    'Entrar Como Restaurant',
                    style: TextStyle(
                        letterSpacing: -0.5,
                        fontFamily: 'YuGothic',
                        fontSize: 12),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
