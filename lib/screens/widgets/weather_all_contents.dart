import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherbloc1_app/bloc/weather_bloc.dart';
import 'package:weatherbloc1_app/global/loading_progress.dart';
import 'package:weatherbloc1_app/screens/widgets/weather_widgets.dart';

import '../../utils/greeting_message.dart';
import '../../utils/weather_icons.dart';

class WeatherAllContents extends StatelessWidget {
  const WeatherAllContents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      Size size = MediaQuery.of(context).size;
      if (state is WeatherLoading) {
        return const LoadingProgress();
      } else if (state is WeatherSuccess) {
        return WeatherWidgets(
          height: size.height,
          width: size.width,
          location: '${state.weather.areaName}',
          greeting: GreetingMessage.greeting(),
          weatherIcon:
              WeatherIcons.getWeatherIcon(state.weather.weatherConditionCode!),
          temperature: state.weather.temperature!.celsius!.toStringAsFixed(0),
          weatherDescription: state.weather.weatherDescription!,
          dateTime:
              DateFormat('EEEE dd •').add_Hm().format(state.weather.date!),
          sunrise: DateFormat().add_Hm().format(state.weather.sunrise!),
          sunset: DateFormat().add_Hm().format(state.weather.sunset!),
          tempmax: state.weather.tempMax!.celsius!.toStringAsFixed(0),
          tempmin: state.weather.tempMin!.celsius!.toStringAsFixed(0),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
