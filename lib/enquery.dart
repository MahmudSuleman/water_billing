import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Enquery extends StatefulWidget {
  const Enquery({super.key});

  @override
  State<Enquery> createState() => _EnqueryState();
}

class _EnqueryState extends State<Enquery> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Align(
          child: Icon(
            Icons.headphones,
            size: 100,
            color: Colors.grey.shade400,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Need Help? Call Us!',
            style: GoogleFonts.robotoMono(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            '0241812087',
            style: GoogleFonts.robotoMono(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          child: GestureDetector(
            onTap: () async {
              Uri phoneno = Uri.parse('tel:+233241812087}');
              if (await launchUrl(phoneno)) {
                //dialer opened
              } else {
                //dailer is not opened
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return Icon(
                    Icons.phone,
                    size: 40 * animationController.value,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
