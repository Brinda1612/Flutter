import 'package:flutter/material.dart';

class button extends StatelessWidget {
  const button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple])
              ),
      child: ElevatedButton(onPressed: () {}, child: Text('Click', style: TextStyle(color: Colors.black),)),
    );
  }
}