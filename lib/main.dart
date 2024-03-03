import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/widgets/expenses.dart';

var kColorSchema =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorSchema =
    ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 5, 99, 125));
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorSchema,

        cardTheme: CardTheme().copyWith(
          color: kDarkColorSchema.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16, 
            vertical: 8
        ),
        ),
       elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorSchema.primaryContainer,
            foregroundColor: kDarkColorSchema.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorSchema,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorSchema.onPrimaryContainer,
          foregroundColor: kColorSchema.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorSchema.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchema.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorSchema.onSecondaryContainer,
              fontSize: 16,
            )),
      ),
      // themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
