// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherAdapterAdapter extends TypeAdapter<WeatherAdapter> {
  @override
  final int typeId = 0;

  @override
  WeatherAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherAdapter(
      country: fields[0] as String?,
      areaName: fields[1] as String?,
      weatherMain: fields[2] as String?,
      weatherDescription: fields[3] as String?,
      weatherIcon: fields[4] as String?,
      latitude: fields[5] as double?,
      longitude: fields[6] as double?,
      date: fields[7] as DateTime?,
      sunrise: fields[8] as DateTime?,
      sunset: fields[9] as DateTime?,
      temperatureCelsius: fields[10] as double?,
      tempMinCelsius: fields[11] as double?,
      tempMaxCelsius: fields[12] as double?,
      tempFeelsLikeCelsius: fields[13] as double?,
      pressure: fields[14] as double?,
      humidity: fields[15] as double?,
      windSpeed: fields[16] as double?,
      windDegree: fields[17] as double?,
      windGust: fields[18] as double?,
      cloudiness: fields[19] as double?,
      rainLastHour: fields[20] as double?,
      rainLast3Hours: fields[21] as double?,
      snowLastHour: fields[22] as double?,
      snowLast3Hours: fields[23] as double?,
      weatherConditionCode: fields[24] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherAdapter obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.areaName)
      ..writeByte(2)
      ..write(obj.weatherMain)
      ..writeByte(3)
      ..write(obj.weatherDescription)
      ..writeByte(4)
      ..write(obj.weatherIcon)
      ..writeByte(5)
      ..write(obj.latitude)
      ..writeByte(6)
      ..write(obj.longitude)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.sunrise)
      ..writeByte(9)
      ..write(obj.sunset)
      ..writeByte(10)
      ..write(obj.temperatureCelsius)
      ..writeByte(11)
      ..write(obj.tempMinCelsius)
      ..writeByte(12)
      ..write(obj.tempMaxCelsius)
      ..writeByte(13)
      ..write(obj.tempFeelsLikeCelsius)
      ..writeByte(14)
      ..write(obj.pressure)
      ..writeByte(15)
      ..write(obj.humidity)
      ..writeByte(16)
      ..write(obj.windSpeed)
      ..writeByte(17)
      ..write(obj.windDegree)
      ..writeByte(18)
      ..write(obj.windGust)
      ..writeByte(19)
      ..write(obj.cloudiness)
      ..writeByte(20)
      ..write(obj.rainLastHour)
      ..writeByte(21)
      ..write(obj.rainLast3Hours)
      ..writeByte(22)
      ..write(obj.snowLastHour)
      ..writeByte(23)
      ..write(obj.snowLast3Hours)
      ..writeByte(24)
      ..write(obj.weatherConditionCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
