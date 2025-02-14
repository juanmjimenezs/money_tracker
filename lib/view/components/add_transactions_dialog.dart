import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/controller/transactions_provider.dart';
import 'package:money_tracker/model/transaction.dart';
import 'package:provider/provider.dart';

class AddTransactionsDialog extends StatefulWidget {
  const AddTransactionsDialog({super.key});

  @override
  State<AddTransactionsDialog> createState() => _AddTransactionsDialogState();
}

class _AddTransactionsDialogState extends State<AddTransactionsDialog> {
  int? typeIndex = 0;
  TransactionType type = TransactionType.expense;
  double amount = 0.0;
  String description = "";

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 650,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 4,
            width: 48,
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: const BorderRadius.all(Radius.circular(2))),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "New Transaction",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal),
            ),
          ),
          CupertinoSlidingSegmentedControl(
              groupValue: typeIndex,
              children: const {0: Text("Expense"), 1: Text("Income")},
              onValueChanged: (value) {
                setState(() {
                  typeIndex = value!;
                  type = value == 0
                      ? TransactionType.expense
                      : TransactionType.income;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          Text(
            'AMOUNT',
            style: textTheme.bodySmall!.copyWith(color: Colors.teal),
          ),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              CurrencyTextInputFormatter.currency(symbol: "\$")
            ],
            autofocus: true,
            decoration: InputDecoration(
              hintText: "\$ 0,00",
              hintStyle:
                  textTheme.bodySmall!.copyWith(color: Colors.grey.shade400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: const EdgeInsets.all(12),
            ),
            onChanged: (value) {
              final valueWithoutDollarSign = value.replaceAll("\$", "");
              final valueWithoutComma =
                  valueWithoutDollarSign.replaceAll(",", "");
              if (valueWithoutComma.isNotEmpty) {
                amount = double.parse(valueWithoutComma);
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'DESCRIPTION',
            style: textTheme.bodySmall!.copyWith(color: Colors.teal),
          ),
          TextField(
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "Enter a description...",
                hintStyle:
                    textTheme.bodySmall!.copyWith(color: Colors.grey.shade400),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.all(12)),
            onChanged: (value) {
              description = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  final transaction = Transaction(
                      amount: amount, description: description, type: type);
                  // Add transaction
                  Provider.of<TransactionsProvider>(context, listen: false)
                      .addTransaction(transaction);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
