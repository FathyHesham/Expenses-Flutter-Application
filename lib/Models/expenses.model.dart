/*
    'id' --> string
    'title'  --> string 
    'amount'  --> double
    'date'  --> DateTime
*/

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid(); 
final dateFormate = DateFormat.yMd();

enum Category { food, travel, leisure, work }


// connect between icon and category
const Map<Category, IconData> categoryIcons = {
  Category.food: Icons.lunch_dining_sharp,
  Category.travel: Icons.flight_takeoff_sharp,
  Category.leisure: Icons.movie_creation_sharp,
  Category.work: Icons.work_history_sharp,
};

class Expenses {
  final String uID; 
  final String title;
  final double salary;
  final DateTime date;
  final Category category; // Category { food , work , travel , leisure }

  String get formattedDate {
    return dateFormate.format(date);
  }

  Expenses({
    required this.category,
    required this.title,
    required this.salary,
    required this.date,
  }) : uID = uuid.v4();
}
