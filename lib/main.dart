import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/widgets/expenses.dart';

void main() {
  runApp(
    const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Expenses(),
  ),);
}

