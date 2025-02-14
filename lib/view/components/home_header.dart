import 'package:flutter/material.dart';
import 'package:money_tracker/controller/transactions_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/header_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<TransactionsProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text("MONEY TRACKER",
              style: textTheme.titleSmall?.copyWith(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Balance",
            style: textTheme.bodySmall?.copyWith(
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.bold),
          ),
          Text(
            "\$ ${provider.balance.toStringAsFixed(2)}",
            style: textTheme.headlineLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                HeaderCard(
                  textTheme: textTheme,
                  textCard: "Incomes",
                  backgroundColor: Colors.green,
                  icon: Icons.arrow_upward,
                  amount: provider.totalIncome,
                ),
                const SizedBox(
                  width: 12,
                ),
                HeaderCard(
                  textTheme: textTheme,
                  textCard: "Expenses",
                  backgroundColor: Colors.red,
                  icon: Icons.arrow_downward,
                  amount: provider.totalExpenses,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
