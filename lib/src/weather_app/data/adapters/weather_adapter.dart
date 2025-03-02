import 'package:hive/hive.dart';
import 'package:weather/weather.dart';

part 'weather_adapter.g.dart'; // Arquivo gerado automaticamente

@HiveType(typeId: 0) // Defina um typeId único para o adapter
class WeatherAdapter extends HiveObject {
  @HiveField(0)
  final String? country;

  @HiveField(1)
  final String? areaName;

  @HiveField(2)
  final String? weatherMain;

  @HiveField(3)
  final String? weatherDescription;

  @HiveField(4)
  final String? weatherIcon;

  @HiveField(5)
  final double? latitude;

  @HiveField(6)
  final double? longitude;

  @HiveField(7)
  final DateTime? date;

  @HiveField(8)
  final DateTime? sunrise;

  @HiveField(9)
  final DateTime? sunset;

  @HiveField(10)
  final double? temperatureCelsius;

  @HiveField(11)
  final double? tempMinCelsius;

  @HiveField(12)
  final double? tempMaxCelsius;

  @HiveField(13)
  final double? tempFeelsLikeCelsius;

  @HiveField(14)
  final double? pressure;

  @HiveField(15)
  final double? humidity;

  @HiveField(16)
  final double? windSpeed;

  @HiveField(17)
  final double? windDegree;

  @HiveField(18)
  final double? windGust;

  @HiveField(19)
  final double? cloudiness;

  @HiveField(20)
  final double? rainLastHour;

  @HiveField(21)
  final double? rainLast3Hours;

  @HiveField(22)
  final double? snowLastHour;

  @HiveField(23)
  final double? snowLast3Hours;

  @HiveField(24)
  final int? weatherConditionCode;

  WeatherAdapter({
    this.country,
    this.areaName,
    this.weatherMain,
    this.weatherDescription,
    this.weatherIcon,
    this.latitude,
    this.longitude,
    this.date,
    this.sunrise,
    this.sunset,
    this.temperatureCelsius,
    this.tempMinCelsius,
    this.tempMaxCelsius,
    this.tempFeelsLikeCelsius,
    this.pressure,
    this.humidity,
    this.windSpeed,
    this.windDegree,
    this.windGust,
    this.cloudiness,
    this.rainLastHour,
    this.rainLast3Hours,
    this.snowLastHour,
    this.snowLast3Hours,
    this.weatherConditionCode,
  });

  // Converte um objeto Weather para WeatherAdapter
  factory WeatherAdapter.fromWeather(Weather weather) {
    return WeatherAdapter(
      country: weather.country,
      areaName: weather.areaName,
      weatherMain: weather.weatherMain,
      weatherDescription: weather.weatherDescription,
      weatherIcon: weather.weatherIcon,
      latitude: weather.latitude,
      longitude: weather.longitude,
      date: weather.date,
      sunrise: weather.sunrise,
      sunset: weather.sunset,
      temperatureCelsius: weather.temperature?.celsius,
      tempMinCelsius: weather.tempMin?.celsius,
      tempMaxCelsius: weather.tempMax?.celsius,
      tempFeelsLikeCelsius: weather.tempFeelsLike?.celsius,
      pressure: weather.pressure,
      humidity: weather.humidity,
      windSpeed: weather.windSpeed,
      windDegree: weather.windDegree,
      windGust: weather.windGust,
      cloudiness: weather.cloudiness,
      rainLastHour: weather.rainLastHour,
      rainLast3Hours: weather.rainLast3Hours,
      snowLastHour: weather.snowLastHour,
      snowLast3Hours: weather.snowLast3Hours,
      weatherConditionCode: weather.weatherConditionCode,
    );
  }

  // Converte um WeatherAdapter de volta para Weather
  Weather toWeather() {
    return Weather({
      'coord': {'lat': latitude, 'lon': longitude},
      'sys': {
        'country': country,
        'sunrise': sunrise?.millisecondsSinceEpoch,
        'sunset': sunset?.millisecondsSinceEpoch
      },
      'name': areaName,
      'main': {
        'temp': temperatureCelsius,
        'temp_min': tempMinCelsius,
        'temp_max': tempMaxCelsius,
        'feels_like': tempFeelsLikeCelsius,
        'pressure': pressure,
        'humidity': humidity,
      },
      'wind': {
        'speed': windSpeed,
        'deg': windDegree,
        'gust': windGust,
      },
      'clouds': {'all': cloudiness},
      'rain': {'1h': rainLastHour, '3h': rainLast3Hours},
      'snow': {'1h': snowLastHour, '3h': snowLast3Hours},
      'weather': [
        {
          'main': weatherMain,
          'description': weatherDescription,
          'icon': weatherIcon,
          'id': weatherConditionCode,
        }
      ],
      'dt': date?.millisecondsSinceEpoch,
    });
  }
}
