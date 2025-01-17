import 'package:adv_basics/Model/question.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/widget/ans_card.dart';
import 'package:adv_basics/widget/button.dart';
import 'package:flutter/material.dart';

class questionScreen extends StatefulWidget {
  const questionScreen({super.key});

  @override
  State<questionScreen> createState() => _questionScreenState();
}

class _questionScreenState extends State<questionScreen> {
  int? selectedansIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAns(int value) {
    setState(() {
      selectedansIndex = value;
      final question = questions[questionIndex];
      if (selectedansIndex == question.correntAnsIndex) {
        score++;
      }
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        selectedansIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLastQuestion = questionIndex == questions.length - 1;

    final question = questions[questionIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black12, Colors.grey])),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                question.question,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap:
                        selectedansIndex == null ? () => pickAns(index) : null,
                    child: AnsCard(
                      currectIndex: index,
                      question: question.options[index],
                      isSelected: selectedansIndex == index,
                      selectedAnsIndex: selectedansIndex,
                      correntAnsIndex: question.correntAnsIndex,
                    ),
                  );
                },
              ),

              isLastQuestion
                  ? button(onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => resultScreen(score: score)
                    ),
                );
              }, label: 'Finish')
                  : button(
                      onPressed:
                          selectedansIndex != null ? goToNextQuestion : null,
                      label: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
