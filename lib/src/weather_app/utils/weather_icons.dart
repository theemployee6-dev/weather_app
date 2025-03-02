import 'package:flutter/material.dart';
import 'package:weatherbloc1_app/src/weather_app/utils/verify_day_or_night.dart';

class WeatherIcons {
  WeatherIcons._();

  static Widget getWeatherIcon(int code) {
    bool isNight = VerifyDayOrNight.verifyDayorNight();
    switch (code) {
      case >= 200 && < 233:
        return Image.asset('assets/${isNight ? '11n.webp' : '11d.webp'}');
      case >= 300 && < 322:
        return Image.asset('assets/${isNight ? '09n.webp' : '09d.webp'}');
      case >= 500 && < 505:
        return Image.asset('assets/${isNight ? '10n.webp' : '10d.webp'}');
      case 511:
        return Image.asset('assets/${isNight ? '13n.webp' : '13d.webp'}');
      case >= 520 && < 532:
        return Image.asset('assets/${isNight ? '09n.webp' : '09d.webp'}');
      case >= 600 && < 623:
        return Image.asset('assets/${isNight ? '13n.webp' : '13d.webp'}');
      case >= 701 && < 782:
        return Image.asset('assets/${isNight ? '50n.webp' : '50d.webp'}');
      case 800:
        return Image.asset('assets/${isNight ? '01n.webp' : '01d.webp'}');
      case 801:
        return Image.asset('assets/${isNight ? '02n.webp' : '02d.webp'}');
      case 802:
        return Image.asset('assets/${isNight ? '03n.webp' : '03d.webp'}');
      case >= 803 && < 805:
        return Image.asset('assets/${isNight ? '03n.webp' : '03d.webp'}');
      default:
        return Image.asset('assets/01d.webp');
    }
  }
}
