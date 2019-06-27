import 'package:flutter/material.dart';
import 'package:upfood_restaurant/src/util/colors.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TopBar(),
          ProductList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: fontBlueColor,
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
              'Products',
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

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      padding: EdgeInsets.only(left: 8, right: 8),
      shrinkWrap: true,
      itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.sallysbakingaddiction.com/wp-content/uploads/2013/04/triple-chocolate-cake-4.jpg'),
            ),
            title: Text(
              'Cake',
              style: TextStyle(color: fontBlueColor, fontSize: 16),
            ),
            subtitle: Text(
              'This cake is the one y...',
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
  }
}
