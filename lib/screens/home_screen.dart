import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30,
          onPressed: () {}
        ),
        title: Text('Food Delivery'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )
            ),
            onPressed: () {}
          )
        ]
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              hintText: 'Search Food or Restaurant',
              prefixIcon: Icon(Icons.search, size: 30),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {},
              ),
              ),
            ),
          )
        ]
      )
    );
  }
}