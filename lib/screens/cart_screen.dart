import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';

class CartScreen extends StatefulWidget {
  // CartScreen();
  // final Order order;
  
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${currentUser.cart.length})'),
      ),
      body: ListView.separated(
        itemCount: currentUser.cart.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildCartItem(currentUser.cart[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1, color: Colors.grey);
        }
      ),
    );
  }
  
  void decreaseOrder() {
  //   int orderLength = currentUser.orders.length;
  //   setState(() {
  //     orderLength = orderLength > 0 ? orderLength-- : 0;
  //     currentUser.orders.length = orderLength;
  //   });
  }
  
  void increaseOrder() {
    // int orderLength = currentUser.orders.length;
    // setState(() {
    //   orderLength++;
    //   currentUser.orders.length++;
    // });
  }
  
  Widget _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 150,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(order.food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.food.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 3),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 3),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: .8,
                              color: Colors.black54,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  )
                                ),
                                onTap: () {
                                  decreaseOrder();
                                }
                              ),
                              SizedBox(width: 20),
                              Text(
                                '${order.quantity}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                )
                              ),
                              SizedBox(width: 20),
                              GestureDetector(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  )
                                ),
                                onTap: () {
                                  increaseOrder();
                                }
                              )
                            ]
                          )
                        )
                      ]
                    ),
                  ),
                )
              ]
            ),
          ),
          Container(
            child: Text(
              '\$${order.quantity * order.food.price}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )
            ),
          )
        ]
      )
    );
  }
}