// import 'dart:ffi';
import 'package:expensetracker/Model/expense_m.dart';
import 'package:expensetracker/expense.dart';
import 'package:flutter/material.dart';

class newExpense extends StatefulWidget {
  const newExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<newExpense> createState() => _newExpenseState();
}

class _newExpenseState extends State<newExpense> {

  final titalController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectDate;
  Category selectedCategory = Category.food;

  void datepicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);

    // print(pickDate);
    setState(() {
      selectDate = pickDate;
    });
  }

  void submitExpenseData() {
    final enterAmount = int.tryParse(amountController
        .text); // tryParse('Hello') => null, tryParse('1.12') => 1.12
    final amountIsInvalid = enterAmount == null || enterAmount <= 0;
    if (titalController.text.trim().isEmpty ||
        amountIsInvalid ||
        selectDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
          title: titalController.text,
          amount: enterAmount,
          date: selectDate!,
          category: selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    titalController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constrains){
      final width = constrains.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if(width >= 600)
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: titalController,
                          maxLength: 50,
                          decoration: InputDecoration(label: Text('Title')),
                        ),
                      ),
                      SizedBox(width: 26,),

                      Expanded(
                        child: TextField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              prefixText: '\$ ', label: Text('Amount')),
                        ),
                      ),
                    ],
                  )
                else
                TextField(
                  controller: titalController,
                  maxLength: 50,
                  decoration: InputDecoration(label: Text('Title')),
                ),

                if(width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                          value: selectedCategory,
                          items: Category.values
                              .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name.toUpperCase())))
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              selectedCategory = value;
                            });
                          }
                          ),
                      SizedBox(width: 26,),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(selectDate == null
                                ? 'No date selected'
                                : formatter.format(selectDate!)),
                            IconButton(
                                onPressed: datepicker,
                                icon: Icon(Icons.calendar_month_sharp))
                          ],
                        ),
                      )
                    ],
                  )
                else
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixText: '\$ ', label: Text('Amount')),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),

                    // Expanded(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    Text(selectDate == null
                        ? 'No date selected'
                        : formatter.format(selectDate!)),
                    IconButton(
                        onPressed: datepicker,
                        icon: Icon(Icons.calendar_month_sharp))
                    // ],
                    // ),
                    // )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),

                if(width >= 600)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancle')),

                      // SAVE BUTTON
                      ElevatedButton(
                          onPressed: submitExpenseData,
                          child: const Text(
                            'Save Expense',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  )

                  else
                Row(
                  children: [
                    DropdownButton(
                        value: selectedCategory,
                        items: Category.values
                            .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase())))
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            selectedCategory = value;
                          });
                        }),
                    Spacer(),

                    // CANCLE BUTTON
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancle')),

                    // SAVE BUTTON
                    ElevatedButton(
                        onPressed: submitExpenseData,
                        child: const Text(
                          'Save Expense',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
    );

  }
}
