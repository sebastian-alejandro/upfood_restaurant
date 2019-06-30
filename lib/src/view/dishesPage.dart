import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/util/colors.dart';
import 'package:upfood_restaurant/src/bloc/dishesBlocProvider.dart';
import 'package:upfood_restaurant/src/model/dishDTO.dart';

class DishesPage extends StatefulWidget {
  @override
  _DishesPageState createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  @override
  Widget build(BuildContext context) {
    return DishesBlocProvider(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            TopBar(),
            DishesList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: fontBlueColor,
        ),
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
          color: Colors.transparent,
          child: Center(
            child: Text(
              'Dishes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: fontBlueColor,
              ),
            ),
          ),
        ),
        GestureDetector(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: fontBlueColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}

class DishesList extends StatefulWidget {
  @override
  _DishesListState createState() => _DishesListState();
}

class _DishesListState extends State<DishesList> {
  DishesBloc _bloc;
  
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
    return Container(
      child: StreamBuilder(
        stream: _bloc.dishesList('flordeChile'),
        builder: (BuildContext context, AsyncSnapshot<List<Dish>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              padding: EdgeInsets.only(left: 8, right: 8),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.restaurant),
                ),
                title: Text(
                  snapshot.data.elementAt(index).name,
                  style: TextStyle(color: fontBlueColor, fontSize: 16),
                ),
                subtitle: Text(
                  snapshot.data.elementAt(index).description,
                  maxLines: 2,
                  style: TextStyle(color: fontBlueColor, fontSize: 12),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '\$' + snapshot.data.elementAt(index).price.toString(),
                      style: TextStyle(color: fontBlueColor, fontSize: 12),
                    ),
                    SizedBox(width: 40),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
                onTap: () {},
              ),
            );
          } else {
            return Text('No DATA');
          }
        },
      ),
    );
  }
}


/*class DishesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('dishes').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            padding: EdgeInsets.only(left: 8, right: 8),
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.sallysbakingaddiction.com/wp-content/uploads/2013/04/triple-chocolate-cake-4.jpg'),
                  ),
                  title: Text(
                    snapshot.data.documents.elementAt(index).data['name'],
                    style: TextStyle(color: fontBlueColor, fontSize: 16),
                  ),
                  subtitle: Text(
                    snapshot.data.documents.elementAt(index).data['description'],
                    style: TextStyle(color: fontBlueColor, fontSize: 12),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Stock',
                        style: TextStyle(color: fontBlueColor, fontSize: 12),
                      ),
                      SizedBox(width: 40),
                      Text(
                        '\$990',
                        style: TextStyle(color: fontBlueColor, fontSize: 12),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
          );
        });
  }
}*/
