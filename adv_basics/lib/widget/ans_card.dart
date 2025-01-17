import 'package:flutter/material.dart';

class AnsCard extends StatelessWidget {
  const AnsCard(
      {super.key,
      required this.question,
      required this.isSelected,
      required this.selectedAnsIndex,
      required this.currectIndex,
      required this.correntAnsIndex});

  final String question;
  final bool isSelected;
  final int currectIndex;
  final int? correntAnsIndex;
  final int? selectedAnsIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAns = currectIndex == correntAnsIndex;
    bool isWorngAns = !isCorrectAns && isSelected;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: selectedAnsIndex != null
      ? Container(
        height: 50,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: isCorrectAns
                  ? Colors.green
                  : isWorngAns
                      ? Colors.red
                      : Colors.white,
            )),
        child: Row(
          children: [
            Expanded(
                child: Text(
              question,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            )),
            SizedBox(
              height: 10,
            ),
            isCorrectAns ? buildCorrectIcon() : isWorngAns ? buildWrongIcon() : const SizedBox.shrink()
          ],
        ),
      )
        : Container(
          height: 50,
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 2,
                color: Colors.white
                //
              )
          ),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                    question,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  )),
              SizedBox(
                height: 10,
              )
            ],
          ),
        )
       
    );
  }
}

Widget buildCorrectIcon() => const CircleAvatar(
  radius: 15,
  backgroundColor: Colors.green,
  child: Icon(Icons.check, color: Colors.white,),
);

Widget buildWrongIcon() => const CircleAvatar(
  radius: 15,
  backgroundColor: Colors.red,
  child: Icon(Icons.check, color: Colors.white,),
);
