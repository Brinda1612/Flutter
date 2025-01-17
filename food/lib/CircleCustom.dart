import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleWithValue extends StatelessWidget {
  final int value;

  const CircleWithValue({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,  // Width of the circle
      height: 60, // Height of the circle
      decoration: BoxDecoration(
        color: Colors.transparent, // No fill color
        shape: BoxShape.circle, // Make it circular
        border: Border.all(
          color: Colors.black,  // Border color
          width: 3,  // Border width
        ),
      ),
      child: Center(
        child: Text(
          '$value', // Price text
          style: TextStyle(
            color: Colors.black, // Text color (same as border)
            fontSize: 18, // Font size of the price
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}