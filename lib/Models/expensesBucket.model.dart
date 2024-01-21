import 'package:expenses_flutter_app/Models/expenses.model.dart';

class ExpenseBucket {
  final Category category;
  final List<Expenses> expenses;

  ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(
      {required this.category, required List<Expenses> allExpenses})
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0.0;
    for (var expense in expenses) {
      sum += expense.salary;
    }
    return sum;
  }
}
