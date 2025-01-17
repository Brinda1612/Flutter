import 'package:adv_basics/Model/question.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/widget/button.dart';
import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  const resultScreen({
    super.key,
    required this.score

  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black12, Colors.grey])),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text('Your Scor',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
        
              SizedBox(height: 100,),
        
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: CircularProgressIndicator(
                      strokeWidth: 12,
                      value: score / 3,
                      color: Colors.green,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        score.toString() + "/3",
                        style: TextStyle(
                          fontSize: 80,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '${(score / questions.length * 100).round()}%',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                        ),
                      ),
        
                    ],
                  )
                ],
              ),
              SizedBox(height: 100,),
              button(onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => home()
                  ),
                );
              }, label: 'Restart')
        
            ],
          ),
        ),
      ),
    );
  }
}