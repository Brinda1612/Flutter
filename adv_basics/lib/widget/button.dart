import 'dart:ffi';

import 'package:flutter/material.dart';

class button extends StatelessWidget {
  const button({
    super.key, 
     required this.onPressed,
     required this.label
    
    });
     
    final VoidCallback? onPressed;
    final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Card(
            color: onPressed != null ? Colors.orange.shade600 : Colors.orange.shade400,
            child: Center(
              child: Text(
                label,
                style: TextStyle(letterSpacing: 2, fontSize: 25, color: Colors.black),),
            ),

          ),


        ));
  }
}