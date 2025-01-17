
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Create a date format
final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { full, half }

const categoryIcon = {
  Category.full: Text('Full'),
  Category.half: Text('Half'),
};

class Food
{
  Food({
    required this.name,
    required this.amount,
    required this.category,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String name;
  final int amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}




