import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:upfood_restaurant/src/bloc/dishesBlocProvider.dart';
import 'package:upfood_restaurant/src/model/dishDTO.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _screensBottomNavigationBar(int index) {
    switch (index) {
      case 0: //Home
        return ListView(
          children: <Widget>[
            TopBar(),
            ScreenTitle(),
            ListDishes(),
          ],
        );
        break;
      case 1: //Map
        return ListView(
          children: <Widget>[
            TopBar(),
            Text('Mapa'),
          ],
        );
        break;
      case 2: //Profile
        return ListView(
          children: <Widget>[
            TopBar(),
            UserProfile(),
          ],
        );
        break;
      default: //Home by Default
        return ListView(
          children: <Widget>[
            TopBar(),
            ScreenTitle(),
            ListDishes(),
          ],
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DishesBlocProvider(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _screensBottomNavigationBar(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.lightBlue,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Inicio'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text('Mapa'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Perfil'),
            ),
          ],
          onTap: _onItemTapped,
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
              'UpFood',
              style: TextStyle(
                fontFamily: 'OpenSans',
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

class ScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16),
      child: Text(
        'Los más ricos platos',
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

/*
class TabsContent extends StatefulWidget {
  @override
  _TabsContentState createState() => _TabsContentState();
}

class _TabsContentState extends State<TabsContent>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          indicatorColor: Color(0xFF707070),
          labelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.grey.withOpacity(0.6),
          isScrollable: true,
          controller: _tabController,
          tabs: <Widget>[
            getTab('amigos'),
            getTab('desayuno'),
            getTab('almuerzo'),
            getTab('cena'),
          ],
        ),
        SizedBox(height: 20),
        TabBarView(
          controller: _tabController,
          children: [
            getDishesList('friends'),
            getDishesList('breakfast'),
            getDishesList('Lunch'),
            getDishesList('Dinner'),
          ],
        ),
      ],
    );
  }

  getTab(String monthName) {
    return Tab(
      child: Text(
        monthName,
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF707070),
        ),
      ),
    );
  }

  getDishesList(String tabSelected) {
    return ListView.builder(
      itemCount: 2,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Stack(
          children: <Widget>[
            Container(
              height: 340,
              width: 200,
              color: Color(0xFF707070),
            ),
          ],
        );
      },
    );
  }
}
*/
class ListDishes extends StatefulWidget {
  @override
  _ListDishesState createState() => _ListDishesState();
}

class _ListDishesState extends State<ListDishes> {
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
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        height: 340,
        child: StreamBuilder(
          stream: _bloc.dishesList('flordeChile'),
          builder: (BuildContext context, AsyncSnapshot<List<Dish>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 340,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFF707070),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(
                                    snapshot.data.elementAt(index).imgUrl),
                                fit: BoxFit.fitHeight),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 0.5, 1.0],
                              colors: [
                                Colors.black,
                                Colors.transparent,
                                Colors.black,
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 340,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 0.5, 1.0],
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data.elementAt(index).name,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 32,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      '\$' +
                                          snapshot.data
                                              .elementAt(index)
                                              .price
                                              .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Color(0xFFFFEE00),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Color(0xFFFFEE00),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Color(0xFFFFEE00),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Color(0xFFFFEE00),
                                        ),
                                        Icon(
                                          Icons.star_half,
                                          size: 18,
                                          color: Color(0xFFFFEE00),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      snapshot.data.elementAt(index).rating,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Text('Cargnado lista...espere');
            }
          },
        ),
      ),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/09/02/12/42/woman-918623_960_720.jpg'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 82),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.16),
                        offset: Offset(0, 3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 58),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Nombre Usuario',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '@n.usuario',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 14,
                            color: Color(0xFF707070),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  'Reseñas',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Color(0xFF707070),
                                    fontSize: 14,
                                  ),
                                ),
                                Text('8',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 24,
                                    color: Color(0xFF707070),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text('Seguidores',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Color(0xFF707070),
                                    fontSize: 14,
                                  ),),
                                Text('12',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 24,
                                    color: Color(0xFF707070),
                                  ),),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text('Siguiendo',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Color(0xFF707070),
                                    fontSize: 14,
                                  ),),
                                Text('34',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 24,
                                    color: Color(0xFF707070),
                                  ),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    'Últimas reseñas...',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/09/02/12/42/woman-918623_960_720.jpg',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
