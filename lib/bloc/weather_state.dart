part of 'weather_bloc.dart';

@immutable
sealed class WeatherState extends Equatable {
  const WeatherState();
}

final class WeatherInitial extends WeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class WeatherLoading extends WeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class WeatherFailure extends WeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class WeatherSuccess extends WeatherState {
  final Weather weather;

  const WeatherSuccess(this.weather);

  @override
  List<Object?> get props => [weather];
}
