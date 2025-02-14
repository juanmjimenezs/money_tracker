import 'package:flutter/material.dart';
import 'package:money_tracker/model/transaction.dart';

class TransactionsProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(
      type: TransactionType.income,
      amount: 1000.00,
      description: "Salary",
    ),
    Transaction(
      type: TransactionType.expense,
      amount: 200.00,
      description: "Rent",
    ),
  ];

  List<Transaction> get transactions => _transactions;

  double get totalIncome {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .fold(0,
            (previousValue, transaction) => previousValue + transaction.amount);
  }

  double get totalExpenses {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .fold(0,
            (previousValue, transaction) => previousValue + transaction.amount);
  }

  double get balance {
    return totalIncome - totalExpenses;
  }

  void removeTransaction(Transaction transaction) {
    _transactions.remove(transaction);
    notifyListeners();
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
