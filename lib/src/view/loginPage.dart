import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/bloc/loginBlocProvider.dart';
import 'package:upfood_restaurant/src/view/userPage.dart';
import 'package:upfood_restaurant/src/view/restaurantPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return LoginBlocProvider(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();

  LoginBloc _bloc;
  String _email;
  String _password;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = LoginBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 240,
      child: Form(
        key: _formKey,
        child: ListView(
          children: getFormWidget(),
        ),
      ),
    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    formWidget.add(
      TextFormField(
        decoration: InputDecoration(
          hintText: 'Email',
          labelText: 'Ingresar Email',
        ),
        validator: (value) {
          return value.isEmpty ? 'Debe ingresar un email' : null;
        },
        onSaved: (value) {
          setState(() {
            this._email = value;
          });
        },
      ),
    );

    formWidget.add(
      TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Ingresar Password',
        ),
        validator: (value) {
          return value.isEmpty ? 'Debe ingresar un password' : null;
        },
        onSaved: (value) {
          setState(() {
            this._password = value;
          });
        },
      ),
    );

    formWidget.add(
      Padding(
        padding: const EdgeInsets.all(32),
        child: ButtonTheme(
          height: 40,
          buttonColor: Color(0xFF52CEE2),
          child: RaisedButton(
            elevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
            onPressed: () {
              if (this._formKey.currentState.validate()) {

                setState(() {
                  this._formKey.currentState.save();
                });

                _bloc.authenticateUser(_email, _password)
                .then((resp) {
                  if (resp) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserPage()),
                    );
                  } else {
                    _bloc.authenticateRestaurant(_email, _password)
                        .then((response) {
                          if (response) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          } else {
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text('Email o Password Incorrectos!')));
                          }
                    });
                  }
                });
              }
            },
          ),
        ),
      ),
    );

    return formWidget;
  }
}
