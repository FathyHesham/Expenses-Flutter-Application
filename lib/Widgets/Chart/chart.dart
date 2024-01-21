import 'package:expenses_flutter_app/Models/expenses.model.dart';
import 'package:expenses_flutter_app/Models/expensesBucket.model.dart';
import 'package:expenses_flutter_app/Widgets/Chart/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expenses> expenses;
  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(allExpenses: expenses, category: Category.food),
      ExpenseBucket.forCategory(allExpenses: expenses, category: Category.work),
      ExpenseBucket.forCategory(
          allExpenses: expenses, category: Category.leisure),
      ExpenseBucket.forCategory(
          allExpenses: expenses, category: Category.travel),
    ];
  }

  double get maxTotalExpenses {
    double maxTotalExpense = 0.0;
    for (var element in buckets) {
      if (element.totalExpenses > maxTotalExpense) {
        maxTotalExpense = element.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return LayoutBuilder(
      builder: (context, constrain) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          width: double.infinity,
          height: constrain.maxHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.3),
                Theme.of(context).colorScheme.primary.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (var element in buckets)
                      ChartBar(
                        fill: element.totalExpenses == 0
                            ? 0
                            : element.totalExpenses / maxTotalExpenses,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: buckets
                    .map(
                      (e) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: isDarkMode
                              ? Icon(
                                  categoryIcons[e.category],
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : Icon(
                                  categoryIcons[e.category],
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.70),
                                ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
