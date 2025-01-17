import 'package:adv_basics/question_screen.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black54, Colors.grey])),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/quiz.png',
                height: 250,
                width: 250,
              ),
              SizedBox(height: 30),
              Text(
                'Learn Flutter the fun way !',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(height: 30),
              OutlinedButton.icon(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => questionScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(),
                  icon: Icon(Icons.arrow_forward,
                      color: Colors.white), // Arrow inside button
                  label: Text('Start Quiz   ',
                      style: TextStyle(color: Colors.white, fontSize: 15)))
            ],
          ),
        ),
      ),
    );
  }
}
