import 'package:expenses_flutter_app/Models/expenses.model.dart';
import 'package:expenses_flutter_app/Widgets/Bottom%20Sheet/expenses_item.widget.dart';
import 'package:flutter/material.dart';

class ExpensesListWidget extends StatelessWidget {
  const ExpensesListWidget({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final void Function(Expenses expenses) onRemoveExpense;

  final List<Expenses> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.70),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),

        key: ValueKey(expenses[index]), // get the key unique value
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        child: ExpensesItem(expense: expenses[index]),
      ),
    );
  }
}
