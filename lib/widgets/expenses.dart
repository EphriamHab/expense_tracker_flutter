
import 'package:expense_tracker_flutter/widgets/chart/chart.dart';
import 'package:expense_tracker_flutter/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_flutter/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
  });

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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _reigsteredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _reigsteredExpenses.indexOf(expense);
    setState(() {
      _reigsteredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Expense deleted!"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _reigsteredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses found. start adding some!"),
    );
    if (_reigsteredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _reigsteredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Expense Tracker"), actions: [
        IconButton(
          onPressed: _openAddExpenseOverlay,
          icon: const Icon(Icons.add),
        ),
      ]),
      body: Column(
        children: [
          Chart(expenses:_reigsteredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
