import 'dart:io';

import 'package:flutter/material.dart';
import 'package:water_billing/enquery.dart';
import 'package:water_billing/helpers.dart';
import 'package:water_billing/home.dart';
import 'package:water_billing/pay_bill.dart';
import 'package:water_billing/settings.dart';
import 'package:water_billing/transactions.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final _pages = [const Home(), const Enquery(), const Settings()];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Water Billing App',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: _pages.elementAt(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Enqueries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.green,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20),
          child: ListView(
            children: [
              MenuItem(
                icon: Icons.home,
                title: 'Home',
                onTap: () {
                  setState(() {
                    _currentPage = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
              MenuItem(
                icon: Icons.message_outlined,
                title: 'Enquiries',
                onTap: () {
                  setState(() {
                    _currentPage = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
              MenuItem(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {
                  setState(() {
                    _currentPage = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white),
              const SizedBox(height: 20),
              MenuItem(
                icon: Icons.credit_card,
                title: 'Pay Bill',
                onTap: () {
                  Navigator.pop(context);
                  navigateTo(
                    context,
                    to: const PayBill(),
                  );
                },
              ),
              const SizedBox(height: 20),
              MenuItem(
                icon: Icons.schedule,
                title: 'Transactions',
                onTap: () {
                  Navigator.pop(context);
                  navigateTo(
                    context,
                    to: const AllTransactions(),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white),
              const SizedBox(height: 20),
              MenuItem(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Logout'),
                          content: const Text(
                            'Are you sure you want to logout?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                exit(1);
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                  ..pop()
                                  ..pop();
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        );
                      });
                },
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
