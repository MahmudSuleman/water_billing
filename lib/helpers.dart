import 'package:flutter/material.dart';

void navigateTo(BuildContext context, {required Widget to}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return to;
      },
    ),
  );
}
