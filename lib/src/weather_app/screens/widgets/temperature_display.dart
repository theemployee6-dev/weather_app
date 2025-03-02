import 'package:flutter/material.dart';

class TemperatureDisplay extends StatelessWidget {
  const TemperatureDisplay(
      {super.key, required this.temperature, required this.weatherDescription});

  final String temperature;
  final String weatherDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$temperature°C',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 55.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          weatherDescription,
          style: const TextStyle(
            letterSpacing: 3,
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
