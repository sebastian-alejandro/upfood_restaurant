import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/bloc/dishesBlocProvider.dart';
import 'package:upfood_restaurant/src/model/dishDTO.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return DishesBlocProvider(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            TopBar(),
            ScreenTitle(),
            DishesList(),
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
              'Reseñas',
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

class ScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, bottom: 24),
      child: Text(
        'Calificaciones',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
          fontSize: 32,
          color: Color(0xFF707070),
        ),
      ),
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
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://keviniscooking.com/wp-content/uploads/2018/02/How-to-Make-Memphis-Dry-Rub-Ribs-square-500x500.jpg"),
                    ),
                  ),
                ),
                title: Text(
                  snapshot.data.elementAt(index).name,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Color(0xFF707070),
                    fontSize: 12,
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Color(0xFFD5C811),
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Color(0xFFD5C811),
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Color(0xFFD5C811),
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Color(0xFFD5C811),
                    ),
                    Icon(
                      Icons.star_half,
                      size: 18,
                      color: Color(0xFFD5C811),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '4.9',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.person,
                                  size: 12,
                                ),
                                Text(
                                  '16',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'reseñas',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.keyboard_arrow_right),

                  ],
                ),
                onTap: () {},
              ),
            );
          } else {
            return Text('Cargnado lista...espere');
          }
        },
      ),
    );
  }
}