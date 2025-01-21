import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealitemTrait extends StatelessWidget {
  const MealitemTrait({super.key, required this.icon, required this.lable});

  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: Colors.black,),
        SizedBox(width: 5,),
        Text(lable, style: TextStyle(color: Colors.black, fontSize: 12),)
      ],
    );
  }
}
