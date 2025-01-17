// ignore_for_file: unused_import

import 'dart:math';

import 'package:expensetracker/Widget/Chart/chart.dart';
import 'package:expensetracker/Widget/expentse_List/expense_list.dart';
import 'package:expensetracker/Model/expense_m.dart';
import 'package:expensetracker/Widget/expentse_List/new_expense.dart';
import 'package:expensetracker/main.dart';
import 'package:flutter/material.dart';

class expense extends StatefulWidget {
  const expense({super.key});

  @override
  State<expense> createState() => _expenseState();
}

class _expenseState extends State<expense> {

  // Dummy date
  final List<Expense> registerExpense = [
    Expense(
        title: 'Flutter',
        amount: 20,
        date: DateTime.now(),
        category: Category.work),Expense(
        title: 'java',
        amount: 20,
        date: DateTime.now(),
        category: Category.travel),Expense(
        title: 'java',
        amount: 20,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Burger',
        amount: 150,
        date: DateTime.now(),
        category: Category.food),

  ];

  void openAddExpense() {
    showModalBottomSheet(
      useSafeArea: true,
      // It cover a whole Screen
      isScrollControlled: true,
        context: context, builder: (context) => newExpense(onAddExpense: addexpense),
    );
  }

  void addexpense(Expense expense){
    registerExpense.add(expense);
  }

  void removeExpens(Expense expense){

    final expenseIndex = registerExpense.indexOf(expense);

    setState(() {
      registerExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
          content: Text("Item is Deleted...."),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: (){
              setState(() {
                registerExpense.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    Widget mainContact = Center(child: Text('No expense found. Start adding some'),
    );
    if(registerExpense.isNotEmpty){
     mainContact =  expenseList(
          expenses: registerExpense,
          onRemoveExpense: removeExpens);
    }

    return Scaffold(

      appBar: AppBar(
        title: Text('Expense Tracker', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
              onPressed: openAddExpense,
              icon: Icon(Icons.add, color: Colors.white,))
        ],
      ),

      body: width < 600 ? Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Chart(expenses: registerExpense,),
          Expanded(
              child: mainContact
          ),
        ],
      ) : Row(
        children: [
          Expanded
          (child: Chart(expenses: registerExpense,)),
          Expanded(
              child: mainContact
          ),
        ],
      )
    );
  }
}
