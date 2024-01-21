import 'package:expenses_flutter_app/Models/expenses.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key, required this.onAddExpenses});
  final void Function(Expenses expenses) onAddExpenses;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  DateTime? selectedDate;
  Category selectedCategory = Category.travel;
  // print the date of (day / month / year) not print the time
  final formator = DateFormat.yMd();

  @override
  void dispose() {
    //! Call the dispose method of the superclass to clean up its resources.
    super.dispose();

    //! Dispose of the titleController object to avoid memory leaks.
    titleController.dispose();
    salaryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                maxLength: 50,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.title_sharp,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  label: const Text('Title'),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Selected Category',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        DropdownButton(
                          value: selectedCategory,
                          items: Category.values
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          item.name.toUpperCase(),
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimaryContainer,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              if (value == null) {
                                return;
                              }
                              selectedCategory = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Selected Date',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // const SizedBox(width: 10),
                  Expanded(
                    child: IconButton(
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                            DateTime.now().year - 1,
                            DateTime.now().month,
                            DateTime.now().day,
                          ),
                          lastDate: DateTime(2030),
                        );
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      },
                      icon: Icon(
                        Icons.calendar_month_sharp,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  // const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          selectedDate == null
                              ? 'No Date Selected'
                              : formator
                                  .format(selectedDate!), // day / month / year
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextField(
                controller: salaryController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.attach_money_sharp,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  label: const Text('Salary'),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final enteredsalary =
                          double.tryParse(salaryController.text);
                      final salaryIsValid =
                          enteredsalary == null || enteredsalary <= 0;

                      if (titleController.text.trim().isEmpty ||
                          salaryIsValid ||
                          selectedDate == null) {
                        //* show message error
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog.adaptive(
                              title: const Text('Invalid Input'),
                              content: const Text(
                                'Please make sure valid title , salary , date and category was entered',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Okay'),
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        widget.onAddExpenses(
                          Expenses(
                            category: selectedCategory,
                            title: titleController.text,
                            salary: enteredsalary,
                            date: selectedDate!,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save Expenses'),
                  ),
                  const SizedBox(width: 70),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
