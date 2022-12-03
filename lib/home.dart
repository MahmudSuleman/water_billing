import 'package:flutter/material.dart';
import 'package:water_billing/pay_bill.dart';
import 'package:water_billing/transaction_card.dart';
import 'package:water_billing/transactions.dart';
import 'package:water_billing/helpers.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: const [
          MeterCard(),
          SizedBox(height: 20),
          TransactionHeader(),
          SizedBox(height: 10),
          TransactionCard(),
          SizedBox(height: 20),
          TransactionCard()
        ],
      ),
    );
  }
}

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

class MeterCard extends StatelessWidget {
  const MeterCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        color: Colors.green.shade100,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            const Text('Flat Rate Meter'),
            const SizedBox(height: 10),
            const Text(
              '143-923-193-673',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'GHC 200',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('More Info'),
                ),
                ElevatedButton(
                  onPressed: () {
                    navigateTo(context, to: PayBill());
                  },
                  child: const Text('Pay Bill'),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
