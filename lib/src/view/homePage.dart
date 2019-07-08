import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:upfood_restaurant/src/util/colors.dart';
import 'package:upfood_restaurant/src/view/dishesPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          TopBar(),
          ScreenTitle(),
          TwoPanelRow(),
          OnePanelRow(),
          HomeMenu(),
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
              'nombreLocal',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF707070),
              ),
            ),
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
      padding: const EdgeInsets.only(top: 24, left: 16),
      child: Text(
        'Panel de Control',
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

class TwoPanelRow extends StatefulWidget {
  @override
  _TwoPanelRowState createState() => _TwoPanelRowState();
}

class _TwoPanelRowState extends State<TwoPanelRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 64,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.16),
                      offset: Offset(0, 3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Nuevos Seguidores',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 12,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_up,
                            color: Color(0xFF35B163),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            '+10',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          CircleAvatar(
                            radius: 12,
                            child: Icon(
                              Icons.person,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 4,
                height: 64,
                color: Color(0xFF96C2B9),
              ),
            ],
          ),
          SizedBox(
            width: 8,
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 64,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.16),
                      offset: Offset(0, 3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Restaurant Rank',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 12,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFDE3B3B),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.star, size: 18, color: Color(0xFFD5C811),),
                              Icon(Icons.star, size: 18, color: Color(0xFFD5C811),),
                              Icon(Icons.star, size: 18, color: Color(0xFFD5C811),),
                              Icon(Icons.star, size: 18, color: Color(0xFFD5C811),),
                              Icon(Icons.star_half, size: 18, color: Color(0xFFD5C811),),
                            ],
                          ),
                          Text(
                            '4.6',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 4,
                height: 64,
                color: Color(0xFF6475C9),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnePanelRow extends StatefulWidget {
  @override
  _OnePanelRowState createState() => _OnePanelRowState();
}

class _OnePanelRowState extends State<OnePanelRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 328,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.16),
                      offset: Offset(0, 3),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
              Container(
                width: 4,
                height: 64,
                color: Color(0xFFE1AB59),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 118,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Mejor Plato',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 12,
                            ),
                          ),
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 210,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, right: 16),
                      child: Text(
                        'Merlusa a la Vasca',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          height: 0.76,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 328,
                height: 226,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.16),
                      offset: Offset(0, 3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: FlutterLogo(),
                      title: Text('Platos',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: FlutterLogo(),
                      title: Text('Ofertas',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: FlutterLogo(),
                      title: Text('Reseñas',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: FlutterLogo(),
                      title: Text('Seguidores',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
