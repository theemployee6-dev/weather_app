import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherbloc1_app/src/weather_app/data/adapters/weather_adapter.dart';

import '../../utils/greeting_message.dart';
import '../../utils/weather_icons.dart';
import 'weather_widgets.dart';

class WeatherAllContents extends StatelessWidget {
  const WeatherAllContents({super.key, required this.weather});

  final WeatherAdapter weather;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WeatherWidgets(
      height: size.height,
      width: size.width,
      location: '${weather.areaName} ,${weather.country}',
      greeting: GreetingMessage.greeting(),
      weatherIcon: WeatherIcons.getWeatherIcon(weather.weatherConditionCode!),
      temperature: weather.temperatureCelsius!.toStringAsFixed(0),
      weatherDescription: weather.weatherDescription,
      dateTime: DateFormat('EEEE dd •').add_Hm().format(weather.date!),
      sunrise: DateFormat().add_Hm().format(weather.sunrise!),
      sunset: DateFormat().add_Hm().format(weather.sunset!),
      tempmax: weather.tempMaxCelsius!.toStringAsFixed(0),
      tempmin: weather.tempMinCelsius!.toStringAsFixed(0),
    );
  }
}
