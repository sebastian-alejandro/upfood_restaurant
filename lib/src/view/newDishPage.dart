import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/bloc/dishesBlocProvider.dart';
import 'package:upfood_restaurant/src/model/dishDTO.dart';
import 'package:upfood_restaurant/src/view/dishesPage.dart';
import 'dart:io';

class NewDishPage extends StatefulWidget {
  @override
  _NewDishPageState createState() => _NewDishPageState();
}

class _NewDishPageState extends State<NewDishPage> {
  @override
  Widget build(BuildContext context) {
    return DishesBlocProvider(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            TopBar(),
            DishForm(),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
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

  final _formKey = GlobalKey<FormState>();

  DishesBloc _bloc;
  String _name;
  String _description;
  int _price;
  int _offerPrice;
  bool _isInOffer = false;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = DishesBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.image,
            size: 30.0,
          ),
          onPressed: () {
            //getImage();
          },
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          /*decoration: BoxDecoration(
            image: DecorationImage(
              image: (_image!=null)?Image.file(
                _image,
              ):NetworkImage(
                "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
              ),
              fit: BoxFit.fitWidth,
            ),
          ),*/
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              height: 440,
              width: MediaQuery.of(context).size.width - 32,
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: getFormWidget(),
                  ),
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
      TextFormField(
        decoration: InputDecoration(
          hintText: 'Nombre',
          labelText: 'Ingresar Nombre',
        ),
        validator: (value) {
          return value.isEmpty ? 'Debe ingresar un nombre' : null;
        },
        onSaved: (value) {
          setState(() {
            this._name = value[0].toUpperCase() + value.substring(1);
          });
        },
      ),
    );

    formWidget.add(
      TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Precio',
          labelText: 'Ingresar Precio',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Debe ingresar un precio';
          } else {
            return value.contains(RegExp(r'[,.-\s]'))
                ? 'Ingrese valor sin puntos, comas ni espacios'
                : null;
          }
        },
        onSaved: (value) {
          setState(() {
            this._price = int.parse(value);
          });
        },
      ),
    );

    formWidget.add(
      TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Precio Oferta',
          labelText: 'Ingresar Precio Oferta (Opcional)',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return null;
          } else {
            return value.contains(RegExp(r'[,.-\s]'))
                ? 'Ingrese valor sin puntos, comas ni espacios'
                : null;
          }
        },
        onSaved: (value) {
          setState(() {
            if (value.isEmpty) {
              this._offerPrice = 0;
            } else {
              this._offerPrice = int.parse(value);
            }
          });
        },
      ),
    );

    formWidget.add(
      TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'Descripción',
          labelText: 'Ingresar Descripción',
        ),
        validator: (value) {
          return value.isEmpty ? 'Debe ingresar una descripción' : null;
        },
        onSaved: (value) {
          setState(() {
            this._description = value;
          });
        },
      ),
    );

    formWidget.add(
      ButtonTheme(
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
                'Agregar Nuevo Plato',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
          onPressed: () {
            if (this._formKey.currentState.validate()) {
              setState(() {
                this._formKey.currentState.save();
              });

              //uploadPic(context);

              _bloc.registerDish(
                  _name,
                  _description,
                  'flordeChile',
                  'https://www.dragonclawacademy.com/wp-content/uploads/2017/04/default-image.jpg',
                  0,
                  0,
                  _price,
                  _offerPrice,
                  _isInOffer,
                  true);
            }
          },
        ),
      ),
    );

    return formWidget;
  }
}
