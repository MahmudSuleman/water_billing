import 'package:flutter/material.dart';
import 'package:water_billing/enquery.dart';
import 'package:water_billing/home.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final _pages = [
    const Home(),
    const Enquery(),
    const Text('settings'),
  ];

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
          child: ListView(children: [
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
            SizedBox(height: 20),
            MenuItem(icon: Icons.message_outlined, title: 'Enquiries'),
            SizedBox(height: 20),
            MenuItem(icon: Icons.settings, title: 'Settings'),
            SizedBox(height: 20),
            Divider(color: Colors.white),
            SizedBox(height: 20),
            MenuItem(icon: Icons.credit_card, title: 'Pay Bill'),
            SizedBox(height: 20),
            MenuItem(icon: Icons.schedule, title: 'Transactions'),
            SizedBox(height: 20),
            MenuItem(icon: Icons.person, title: 'Account Info'),
            SizedBox(height: 20),
            Divider(color: Colors.white),
          ]),
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
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
