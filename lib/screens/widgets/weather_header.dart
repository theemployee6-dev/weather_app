import 'package:flutter/material.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader(
      {super.key,
      required this.location,
      required this.greeting,
      required this.weatherIcon});
  final String location;
  final String greeting;
  final Widget weatherIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "📍 $location",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          greeting,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        weatherIcon,
      ],
    );
  }
}
