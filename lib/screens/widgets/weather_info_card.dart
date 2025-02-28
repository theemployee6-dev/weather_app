import 'package:flutter/material.dart';

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard(
      {super.key,
      required this.title,
      required this.value,
      required this.iconPath,
      this.celsius = false});
  final bool? celsius;
  final String title;
  final String value;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(iconPath, scale: 8.0),
        const SizedBox(width: 5.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              celsius == true ? "$value°C" : value,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
