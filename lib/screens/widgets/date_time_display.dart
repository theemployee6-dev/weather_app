import 'package:flutter/material.dart';

class DateTimeDisplay extends StatelessWidget {
  const DateTimeDisplay({super.key, required this.dateTime});
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Text(
      dateTime,
      style: const TextStyle(
        letterSpacing: 5,
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
