import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.green.shade200,
              padding: const EdgeInsets.all(10),
              child: Text(
                'Account Info',
                style: GoogleFonts.robotoMono(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const AccountRow(title: 'Name', text: 'Mahmud Wunnam'),
            const Divider(),
            AccountRow(
              title: 'Phone Number',
              text: '0241812890',
              right: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
            const Divider(),
            AccountRow(
              title: 'Email',
              text: 'lazyprogramm5@gmail.com',
              right: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
            const Divider(),
            AccountRow(
              title: 'Digital Address',
              text: 'GK-0223-78',
              right: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
            const Divider(),
          ],
        ),
      )),
    );
  }
}

class AccountRow extends StatelessWidget {
  const AccountRow({
    super.key,
    required this.title,
    required this.text,
    this.right,
  });

  final String title;
  final String text;
  final Widget? right;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        right ?? const SizedBox.shrink()
      ],
    );
  }
}
