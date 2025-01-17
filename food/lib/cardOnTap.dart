import 'package:flutter/material.dart';
import 'package:food/CircleCustom.dart';
import 'Model/food_m.dart';

class cardOnTap extends StatefulWidget {
  const cardOnTap({
    super.key,
    required this.food,
  });

  final Food food;

  @override
  State<cardOnTap> createState() => _cardOnTapState();
}

class _cardOnTapState extends State<cardOnTap> {
  // List to store the values of clicked circles (numbers)
  List<int> clickedValues = [];

  // Function to add a new value to the list when a circle is clicked
  void addValueToList(int value) {
    setState(() {
      clickedValues.add(value); // Add the clicked circle's value to the list
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.fromLTRB(10,60,10,0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.food.name, style: TextStyle(fontSize: 30),),
              ],
            ),

            Row(
              children: [
                Text(widget.food.amount.toString(), style: TextStyle(fontSize: 15),),
                Expanded(
            child: ListView.builder(
            itemCount: clickedValues.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${clickedValues[index]}', // Display only the number
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                );
              },
            ),
      ),
                Spacer(),
                Text(widget.food.formattedDate, style: TextStyle(fontSize: 15),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      addValueToList(5); // Add 5 when this circle is clicked
                    },
                    child: CircleWithValue(value: 40),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      addValueToList(10); // Add 10 when this circle is clicked
                    },
                    child: CircleWithValue(value: 60),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      addValueToList(15); // Add 15 when this circle is clicked
                    },
                    child: CircleWithValue(value: 120),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}