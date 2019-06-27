import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/util/colors.dart';
import 'package:upfood_restaurant/src/view/productsPage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TopBar(),
          TabsContent(),
          SizedBox(height: 41),
          BtnMenu(),
        ],
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
              'Dashboard',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: fontBlueColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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
    _tabController = TabController(vsync: this, length: 12);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          indicatorColor: fontBlueColor,
          labelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.grey.withOpacity(0.6),
          isScrollable: true,
          controller: _tabController,
          tabs: <Widget>[
            getTab('Jan'),
            getTab('Feb'),
            getTab('Mar'),
            getTab('Apr'),
            getTab('May'),
            getTab('Jun'),
            getTab('Jul'),
            getTab('Aug'),
            getTab('Sept'),
            getTab('Oct'),
            getTab('Nov'),
            getTab('Dec'),
          ],
        ),
        SizedBox(height: 20),
        Container(
          height: 290,
          width: 340,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 4,
              ),
            ],
          ),
          child: TabBarView(
            controller: _tabController,
            children: [
              getChart('January'),
              getChart('February'),
              getChart('March'),
              getChart('April'),
              getChart('May'),
              getChart('June'),
              getChart('July'),
              getChart('August'),
              getChart('September'),
              getChart('October'),
              getChart('November'),
              getChart('December'),
            ],
          ),
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
          color: fontBlueColor,
        ),
      ),
    );
  }

  getChart(String monthName) {
    return Stack(
      children: <Widget>[
        Container(
          height: 290,
          width: 340,
          color: Color(0xFFBCE0FD),
        ),
        Center(
            child: Icon(
          Icons.insert_chart,
          color: fontBlueColor,
          size: 64,
        )),
        Padding(
          padding: EdgeInsets.only(top: 260, left: 30),
          child: Text(
            'Products sold ' + monthName,
            style: TextStyle(
                color: Color(0xFF4D4F5C), fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}

class BtnMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ButtonTheme(
              minWidth: 148,
              height: 48,
              buttonColor: fontBlueColor,
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
                      'PRODUCTS',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductsPage()),
                  );
                },
              ),
            ),
            ButtonTheme(
              minWidth: 148,
              height: 48,
              buttonColor: fontBlueColor,
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
                      'OFFERS',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ButtonTheme(
              minWidth: 148,
              height: 48,
              buttonColor: fontBlueColor,
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
                      'REVIEWS',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            ButtonTheme(
              minWidth: 148,
              height: 48,
              buttonColor: fontBlueColor,
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
                      'STATS',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
