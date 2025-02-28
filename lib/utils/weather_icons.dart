import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherIcons {
  WeatherIcons._();

  static bool verifyDayorNight() {
    DateTime now = DateTime.now();
    String formattedHour = DateFormat('HH').format(now);
    int hour = int.parse(formattedHour);

    return (hour >= 18 || hour < 6);
  }

  static Widget getWeatherIcon(int code) {
    bool isNight = verifyDayorNight();
    switch (code) {
      case >= 200 && < 233:
        return Image.asset('assets/${isNight ? '11n.png' : '11d.png'}');
      case >= 300 && < 322:
        return Image.asset('assets/${isNight ? '09n.png' : '09d.png'}');
      case >= 500 && < 505:
        return Image.asset('assets/${isNight ? '10n.png' : '10d.png'}');
      case 511:
        return Image.asset('assets/${isNight ? '13n.png' : '13d.png'}');
      case >= 520 && < 532:
        return Image.asset('assets/${isNight ? '09n.png' : '09d.png'}');
      case >= 600 && < 623:
        return Image.asset('assets/${isNight ? '13n.png' : '13d.png'}');
      case >= 701 && < 782:
        return Image.asset('assets/${isNight ? '50n.png' : '50d.png'}');
      case 800:
        return Image.asset('assets/${isNight ? '01n.png' : '01d.png'}');
      case 801:
        return Image.asset('assets/${isNight ? '02n.png' : '02d.png'}');
      case 802:
        return Image.asset('assets/${isNight ? '03n.png' : '03d.png'}');
      case >= 803 && < 805:
        return Image.asset('assets/${isNight ? '03n.png' : '03d.png'}');
      default:
        return Image.asset('assets/01d.png');
    }
  }
}
