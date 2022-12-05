import 'package:flutter/material.dart';
import 'package:water_billing/transaction_card.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});
  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Transactions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.list,
                      size: 50,
                    ),
                    Text('No data')
                  ],
                ),
              )
            : ListView(
                children: const [
                  TransactionCard(),
                  SizedBox(height: 20),
                  TransactionCard()
                ],
              ),
      ),
    );
  }
}
