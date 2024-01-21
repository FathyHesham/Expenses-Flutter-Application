import 'package:expenses_flutter_app/Models/expenses.model.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

  final Expenses expense;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  categoryIcons[expense.category],
                  color: isDarkMode
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primary.withOpacity(0.70),
                ),
                const SizedBox(width: 5),
                Text(
                  expense.formattedDate,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money_sharp,
                      color: isDarkMode
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.70),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      expense.salary.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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
