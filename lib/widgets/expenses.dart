import 'package:expense_tracker_flutter/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/models/expense.dart';


class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _reigsteredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99, 
      date: DateTime.now(), 
      category: Category.work,
    ),
    Expense(
      title: "Cinema",
      amount: 15.69, 
      date: DateTime.now(), 
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          const Text("Expense Tracker"),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.add),
          ),
        ],
        ),

      ),
      body: Column(
        children: [
         const Text("The chart"),
          Expanded(child: 
          ExpensesList(expenses: _reigsteredExpenses,))
        ],
      ),
    );
  }
}
