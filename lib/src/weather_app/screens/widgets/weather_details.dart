import 'package:flutter/material.dart';

import 'weather_info_card.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails(
      {super.key,
      required this.tempMax,
      required this.sunrise,
      required this.sunset,
      required this.tempMin});
  final String tempMax;
  final String sunrise;
  final String sunset;
  final String tempMin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherInfoCard(
              iconPath: 'assets/11.webp',
              title: 'Sunrise',
              value: sunrise,
            ),
            WeatherInfoCard(
              iconPath: 'assets/12.webp',
              title: 'Sunset',
              value: sunset,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Divider(color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherInfoCard(
              iconPath: 'assets/13.webp',
              title: 'Temp Max',
              value: tempMax,
              celsius: true,
            ),
            WeatherInfoCard(
              iconPath: 'assets/14.webp',
              title: 'Temp Min',
              value: tempMin,
              celsius: true,
            ),
          ],
        ),
      ],
    );
  }
}
