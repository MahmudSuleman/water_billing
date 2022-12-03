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
                child:
                    Column(children: [Image.asset('assests/image/note.svg')]),
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
