import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:weather/weather.dart';
import 'package:weatherbloc1_app/src/weather_app/data/adapters/weather_adapter.dart';

import '../../data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // Box do Hive para armazenar dados do clima

  final Box<WeatherAdapter> weatherBox;

  WeatherBloc({required this.weatherBox}) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());

    try {
      WeatherFactory wf =
          WeatherFactory(apiKey, language: Language.PORTUGUESE_BRAZIL);

      // Busca os dados do clima com base na localização
      Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude, event.position.longitude);

      // Converte o Weather para WeatherAdapter
      final WeatherAdapter weatherAdapter = WeatherAdapter.fromWeather(weather);

      // Verifica se há dados no Hive
      final WeatherAdapter? cachedWeatherAdapter =
          weatherBox.get('cachedWeather');

      // Compara os dados da API com os dados do Hive
      if (cachedWeatherAdapter == null ||
          !_areWeatherDataEqual(cachedWeatherAdapter, weatherAdapter)) {
        // Se os dados forem diferentes, atualiza o Hive
        weatherBox.put('cachedWeather', weatherAdapter);
      }

      // Exibe os dados do Hive
      emit(WeatherSuccess(weatherBox));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }

  // Método para comparar os dados da API com os dados do Hive
  bool _areWeatherDataEqual(WeatherAdapter cached, WeatherAdapter newData) {
    return cached.temperatureCelsius == newData.temperatureCelsius &&
        cached.tempMinCelsius == newData.tempMinCelsius &&
        cached.tempMaxCelsius == newData.tempMaxCelsius &&
        cached.weatherDescription == newData.weatherDescription &&
        cached.weatherConditionCode == newData.weatherConditionCode;
  }
}
