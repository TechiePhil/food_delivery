import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  RatingStars(this.rating);
  final int rating;
  
  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '* ';
    }
    return Text(
      stars.trim(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20
      )
    );
  }
}