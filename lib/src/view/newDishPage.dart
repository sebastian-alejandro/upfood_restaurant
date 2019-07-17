import 'package:flutter/material.dart';

class NewDishPage extends StatefulWidget {
  @override
  _NewDishPageState createState() => _NewDishPageState();
}

class _NewDishPageState extends State<NewDishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TopBar(),
          DishForm(),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 48,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF000000).withOpacity(0.16),
                offset: Offset(0, 3),
                blurRadius: 16,
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Nuevo Plato',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                color: Color(0xFF707070),
              ),
            ),
          ),
        ),
        GestureDetector(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color(0xFF707070),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Inicio'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          title: Text('Gráficos'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store),
          title: Text('Restaurant'),
        ),
      ],
    );
  }
}


class DishForm extends StatefulWidget {
  @override
  _DishFormState createState() => _DishFormState();
}

class _DishFormState extends State<DishForm> {
  final _formkey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 230,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'http://recetasthermomix.cl/wp-content/uploads/2015/01/chupe-jaiba-1100x715.jpg',
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              height: 340,
              width: MediaQuery.of(context).size.width-32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.16),
                    offset: Offset(0, 3),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Form(
                key: _formkey,
                child: ListView(
                  children: getFormWidget(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();
    formWidget.add(
      new TextFormField(
          key: _passKey,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Password', labelText: 'Enter Password'),
        validator: (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        },
      ),
    );

    formWidget.add(
      new TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Confirm Password',
              labelText: 'Enter Confirm Password'),
          validator: (String value) {
            return value.contains('@') ? 'Do not use the @ char.' : null;
          },
          onSaved: (value) {
            setState(() {
              _password = value;
            });
          }),
    );
    return formWidget;
  }
}

