import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/bloc/dishesBlocProvider.dart';
import 'package:upfood_restaurant/src/model/dishDTO.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return DishesBlocProvider(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            TopBar(),
            ScreenTitle(),
            ListDishes(),
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
          icon: Icon(Icons.location_on),
          title: Text('Mapa'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Perfil'),
        ),
      ],
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
      padding: const EdgeInsets.only(left: 24, top: 24),
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
                    padding: const EdgeInsets.only(right: 24),
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
                                    snapshot.data.elementAt(index).imgUrl
                                ),
                                fit: BoxFit.fitHeight
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0,0.5,1.0],
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
                              stops: [0.0,0.5,1.0],
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
                                    child: Text(snapshot.data.elementAt(index).name,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 32,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white
                                      ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text('\$' + snapshot.data.elementAt(index).price.toString(),
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white
                                      ),),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8, right: 8),
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
                                    Text(snapshot.data.elementAt(index).rating, style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 24, fontWeight: FontWeight.w300),),
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
