import 'package:expensetracker/Model/expense_m.dart';
import 'package:expensetracker/Widget/expentse_List/expense_item.dart';
import 'package:flutter/material.dart';

class expenseList extends StatelessWidget {
  const expenseList({
    super.key,
    required this.expenses, required this.onRemoveExpense
  });

  final void Function(Expense expense) onRemoveExpense;


  // from mode Expense file and that value store in variable of expenses
  final List<Expense> expenses;



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
          background: Container(color: Theme.of(context).colorScheme.error,),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            }  ,
            child: expenseItem(expenses[index],
            )
        )
    );
  }
}