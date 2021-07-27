import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/widgets/rating_stars.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: EdgeInsets.only(left:50, right: 50, top: 100),
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
              ),
            ]
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    Text(
                      'less than 2 miles away',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      )
                    )
                  ]
                ),
                RatingStars(widget.restaurant.rating),
                SizedBox(height:2),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Reviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    )
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColor
                  ),
                ),
                onPressed: () {}
              ),
              TextButton(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )
                  )
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColor,
                  )
                ),
                onPressed: () {}
              )
            ]
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2
              )
            )
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              children: List.generate(
                widget.restaurant.menu.length, (index) {
                  Food food = widget.restaurant.menu[index];
                  return Center(
                    child: _buildMenuItem(food),
                  );
                })
            ),
          )
        ]
      )
    );
  }
  
  Widget _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(menuItem.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15)
            )
          ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  Colors.black.withOpacity(.3),
                  Colors.black87.withOpacity(.3),
                  Colors.black54.withOpacity(.3),
                  Colors.black38.withOpacity(.3),
                ],
                stops: [.1, .4, .6, .9],
              )
            )
          ),
          Positioned(
            bottom: 60,
            child: Column(
              children: <Widget>[
                Text(
                  menuItem.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 1.2,
                  )
                ),
                Text(
                  '\$${menuItem.price}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 1.2,
                  )
                )
              ]
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              // margin: EdgeInsets.only(right: 14),
              // width: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(38),
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 30,
                color: Colors.white,
                onPressed: () {},
              )
            ),
          )
        ]
      )
    );
  }
}