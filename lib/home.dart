import 'package:flutter/material.dart';
import 'package:water_billing/complaints.dart';
import 'package:water_billing/helpers.dart';
import 'package:water_billing/meter_card.dart';
import 'package:water_billing/pay_bill.dart';
import 'package:water_billing/transactions.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: ListView(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: 'Hello, '),
                TextSpan(
                  text: 'Mahmud!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const MeterCard(),
          const SizedBox(height: 20),
          const QuickAccessHeader(),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 0.5,
            children: [
              QuickAccessItem(
                icon: Icons.payment,
                text: 'Pay Bill',
                onTap: () {
                  navigateTo(context, to: const PayBill());
                },
              ),
              QuickAccessItem(
                icon: Icons.history,
                text: 'Transactions',
                onTap: () {
                  navigateTo(context, to: const AllTransactions());
                },
              ),
              QuickAccessItem(
                icon: Icons.money,
                text: 'Current Bill',
                onTap: () {
                  _buildCurrentBillInfo(context);
                },
              ),
              QuickAccessItem(
                icon: Icons.headphones,
                text: 'Complaints',
                onTap: () {
                  navigateTo(context, to: const Complaints());
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildTableRow(String leftText, String rightText) {
    return DataRow(
      cells: [
        DataCell(Text(leftText)),
        DataCell(Text(rightText)),
      ],
    );
  }

  _buildCurrentBillInfo(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'January 2023',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: SizedBox.shrink()),
                      DataColumn(label: SizedBox.shrink()),
                    ],
                    rows: [
                      _buildTableRow('Acc #', '123123123'),
                      _buildTableRow('Name', 'Mahmud Wunnam'),
                      _buildTableRow('Prev', '0'),
                      _buildTableRow('New', '0'),
                      _buildTableRow('Used', '0 @ 4.0232'),
                      _buildTableRow('Water Amt', '0'),
                      _buildTableRow('1% fire', '0'),
                      _buildTableRow('1% rural', '0'),
                      _buildTableRow('Month TOT', '0'),
                      _buildTableRow('Prev Bal', '20'),
                      _buildTableRow('Bal Due', '40'),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'View Statement',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class QuickAccessItem extends StatelessWidget {
  const QuickAccessItem({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 5),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class QuickAccessHeader extends StatelessWidget {
  const QuickAccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey.shade400,
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
