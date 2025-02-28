import 'package:flutter/material.dart';

import 'date_time_display.dart';
import 'temperature_display.dart';
import 'weather_details.dart';
import 'weather_header.dart';

class WeatherWidgets extends StatelessWidget {
  const WeatherWidgets({
    super.key,
    required this.height,
    required this.width,
    this.location,
    this.greeting,
    this.weatherIcon,
    this.temperature,
    this.weatherDescription,
    this.dateTime,
    this.sunrise,
    this.sunset,
    this.tempmax,
    this.tempmin,
  });

  final double height;
  final double width;
  final String? location;
  final String? greeting;
  final Widget? weatherIcon;
  final String? temperature;
  final String? weatherDescription;
  final String? dateTime;
  final String? sunrise;
  final String? sunset;
  final String? tempmax;
  final String? tempmin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WeatherHeader(
            location: location ?? 'no location information',
            greeting: greeting ?? 'no greeting information',
            weatherIcon: weatherIcon ?? const SizedBox(),
          ),
          TemperatureDisplay(
            temperature: temperature ?? 'no temperature',
            weatherDescription:
                weatherDescription ?? 'no Weather Description information',
          ),
          const SizedBox(height: 10.0),
          DateTimeDisplay(
            dateTime: dateTime ?? 'no dataTime information',
          ),
          const SizedBox(height: 30.0),
          WeatherDetails(
            sunrise: sunrise ?? 'no sunrise information',
            sunset: sunset ?? 'no sunset information',
            tempMax: tempmax ?? 'no tempmax information',
            tempMin: tempmin ?? 'no tempmin information',
          ),
        ],
      ),
    );
  }
}
