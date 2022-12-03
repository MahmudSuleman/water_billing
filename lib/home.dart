import 'package:flutter/material.dart';
import 'package:water_billing/meter_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: ListView(
        children: [
          const Text('Hello, Mahmud'),
          const SizedBox(height: 10),
          const MeterCard(),
          const SizedBox(height: 20),
          const QuickAccessHeader(),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: const [
              QuickAccessItem(),
              QuickAccessItem(),
            ],
          )
        ],
      ),
    );
  }
}

class QuickAccessItem extends StatelessWidget {
  const QuickAccessItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.credit_card),
        SizedBox(height: 10),
        Text('Transactions')
      ],
    );
  }
}

class QuickAccessHeader extends StatelessWidget {
  const QuickAccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey.shade300,
      child: const Text(
        'Quick Access',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
