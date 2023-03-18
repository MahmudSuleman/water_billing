import 'package:flutter/material.dart';
import 'package:water_billing/complaint_add.dart';
import 'package:water_billing/helpers.dart';

class Complaints extends StatelessWidget {
  const Complaints({super.key});
  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Complaits'),
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
              : const SizedBox()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(context, to: const ComplaintAdd());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
