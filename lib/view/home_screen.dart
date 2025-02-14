import 'package:flutter/material.dart';
import 'components/add_transactions_dialog.dart';
import 'components/home_header.dart';
import 'components/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: const SafeArea(
        bottom: false,
        child: Column(children: [
          HomeHeader(),
          TransactionList(),
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a bottom sheet to add transactions
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return const AddTransactionsDialog();
            }
          );
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}