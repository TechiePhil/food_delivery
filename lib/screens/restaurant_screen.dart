import 'package:flutter/material.dart';
import '../models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({this.restaurant});
  
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                transitionOnUserGestures: true,
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      iconSize: 34,
                      color: Colors.pinkAccent,
                      // color: Theme.of(context).primaryColor,
                      onPressed: () {}
                    )
                  ]
                ),
              )
            ]
          )
        ]
      )
    );
  }
}