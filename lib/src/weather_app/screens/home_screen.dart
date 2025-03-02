import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:weatherbloc1_app/src/weather_app/bloc_weather/bloc/weather_bloc.dart';

import '../bloc_location/bloc/location_bloc.dart';
import '../global/loading_progress.dart';

import 'widgets/location_failure_widget.dart';
import 'widgets/weather_blurred_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _checkHiveAndFetchData();
  }

  void _checkHiveAndFetchData() {
    final weatherBox = context.read<WeatherBloc>().weatherBox;

    final cachedWeatherAdapter = weatherBox.get('cachedWeather');

    if (cachedWeatherAdapter == null) {
      context.read<LocationBloc>().add(const FetchLocation());
    }
  }

  @override
  void dispose() {
    Hive.box('weatherBox').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, locationState) {
        if (locationState is LocationLoading) {
          return const LoadingProgress();
        } else if (locationState is LocationFailure) {
          return const LocationFailureWidget();
        } else if (locationState is LocationSuccess) {
          context.read<WeatherBloc>().add(FetchWeather(locationState.position));
        }
        return BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, weatherState) {
          final weatherBox = context.read<WeatherBloc>().weatherBox;

          final cachedWeatherAdapter = weatherBox.get('cachedWeather');

          if (cachedWeatherAdapter != null) {
            // final cachedWeather = cachedWeatherAdapter.toWeather();
            return WeatherBlurredBackground(
              weather: cachedWeatherAdapter,
            );
          }
          return const LoadingProgress();
        });
      }),
    );
  }
}
