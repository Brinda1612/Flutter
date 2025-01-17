import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentdice = 2;
  void RollDice() {
    setState(() {
      currentdice = Random().nextInt(6) + 1;
    });
    print('dice chang---');
    print(currentdice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blue, Colors.deepPurple])
                  ),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'asset/Side_$currentdice.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: RollDice,
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(fontSize: 20)),
                  child: Text('Roll Dice '))
            ],
          ))),
    );
  }
}
