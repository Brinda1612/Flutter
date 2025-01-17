
import 'dart:math';

import 'package:expensetracker/expense.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Create a date format
final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, work }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class Expense
{
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class expenseBucket{
  expenseBucket({
    required this.category,
    required this.expenses,
});
final Category category;
final List<Expense> expenses;

expenseBucket.forCategory(
    List<Expense> allExpense, this.category) : expenses = allExpense.where(
        (expense) => expense.category == category).toList();

  int get totalExpense{
    int sum = 0;
    for(final expense in expenses){
      sum += expense.amount;  // (a = a+b)
    }

    return sum;
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// import 'package:intl/intl.dart';
//
// const uuid = Uuid();
// final formatter = DateFormat.yMd();
// enum Category { food, travel, work }
//
// const categoryIcon = {
//   Category.work : Icons.work,
//   Category.food : Icons.lunch_dining,
//   Category.travel : Icons.flight_takeoff,
// };
//
// class Expense{
//   Expense({
//     required this.title,
//     required this.amount,
//     required this.date,
//     required this.category
// }) : id = uuid.v4();
//
//   final String id;
//   final String title;
//   final int amount;
//   final DateTime date;
//   final Category category;
//
//   String get formattedDate{
//     return formattedDate.format(date);
//   }
// }


