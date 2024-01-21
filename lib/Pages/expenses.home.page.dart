import 'package:expenses_flutter_app/Models/expenses.model.dart';
import 'package:expenses_flutter_app/Widgets/Bottom%20Sheet/data_bottomsheet.widget.dart';
import 'package:expenses_flutter_app/Widgets/Bottom%20Sheet/expenses_list.widget.dart';
import 'package:expenses_flutter_app/Widgets/Chart/chart.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final List<Expenses> _registeredExpenses = [
    Expenses(
      category: Category.work,
      title: 'Flutter Course',
      salary: 30.0,
      date: DateTime.now(),
    ),
    Expenses(
      category: Category.food,
      title: 'BreakFast',
      salary: 31.1,
      date: DateTime.now(),
    ),
    Expenses(
      category: Category.leisure,
      title: 'Cinema',
      salary: 25.6,
      date: DateTime.now(),
    ),
  ];

  void addExpenses(Expenses expenses) {
    setState(() {
      _registeredExpenses.add(expenses);
    });
  }

  void removeExpenses(Expenses expenses) {
    setState(() {
      _registeredExpenses.remove(expenses);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expenses Tracker'),
        centerTitle: true,
        actions: [
          IconButton(
            padding: const EdgeInsets.all(20.0),
            onPressed: () {
              showBottomSheetWidget(context);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: width < 600
            ? Column(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(
                    child: ExpensesListWidget(
                      expenses: _registeredExpenses,
                      onRemoveExpense: removeExpenses,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(
                    child: ExpensesListWidget(
                      expenses: _registeredExpenses,
                      onRemoveExpense: removeExpenses,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  showBottomSheetWidget(BuildContext context) {
    return showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomSheetWidget(onAddExpenses: addExpenses);
      },
    );
  }
}
