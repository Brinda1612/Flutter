import 'package:expensetracker/Model/expense_m.dart';
import 'package:expensetracker/main.dart';
import 'package:flutter/material.dart';

class expenseItem extends StatelessWidget {
  const expenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).colorScheme;
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text('\$ ${expense.amount.toStringAsFixed(2)}'
                    //     12.1111 => 12.11, \$ THIS is use for printing a simbol behind a amount
                    ),
                Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expense.category]),
                    SizedBox(
                      width: 8,
                    ),
                    Text(expense.formattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
