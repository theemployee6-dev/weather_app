part of 'weather_bloc.dart';

@immutable
sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final Box<WeatherAdapter> weatherAdapter;

  const WeatherSuccess(this.weatherAdapter);

  @override
  List<Object> get props => [weatherAdapter];
}

final class WeatherFailure extends WeatherState {
  final String error;

  const WeatherFailure(this.error);

  @override
  List<Object> get props => [error];
}
