import 'package:flutter/material.dart';
import 'package:water_billing/helpers.dart';
import 'package:water_billing/transactions.dart';

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Latest Transactions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              navigateTo(
                context,
                to: const AllTransactions(),
              );
            },
            child: const Text(
              'View All',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
