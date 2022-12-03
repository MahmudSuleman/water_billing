import 'package:flutter/material.dart'; 

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
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: const [
              Text('Flat Rate Meter'),
              SizedBox(height: 10),
              Text(
                '143-923-193-673',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'GHC 200',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
