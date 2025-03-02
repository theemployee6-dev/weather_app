import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherbloc1_app/src/weather_app/bloc_weather/bloc/weather_bloc.dart';
import 'package:weatherbloc1_app/src/weather_app/data/adapters/weather_adapter.dart';

import 'blurred_background.dart';
import 'colored_circle.dart';
import 'weather_all_contents.dart';

class WeatherBlurredBackground extends StatelessWidget {
  const WeatherBlurredBackground({super.key, this.weather});

  final WeatherAdapter? weather;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(40.0, 1.2 * kToolbarHeight, 40.0, 20.0),
      child: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            const ColoredCircle(
              alignment: AlignmentDirectional(3, -0.3),
              color: Colors.deepPurple,
              height: 300,
              width: 300,
            ),
            const ColoredCircle(
              alignment: AlignmentDirectional(-3, -0.3),
              color: Colors.deepPurple,
              height: 300,
              width: 300,
            ),
            const ColoredCircle(
              alignment: AlignmentDirectional(0, -1.2),
              color: Color(0XFFFFAB40),
              height: 300,
              width: 600,
            ),
            const BlurredBackground(sigmaX: 100.0, sigmaY: 100.0),
            RefreshIndicator(
              color: Colors.red,
              backgroundColor: Colors.black,
              onRefresh: () async {
                try {
                  // Obtém a localização atual
                  final position = await Geolocator.getCurrentPosition();

                  // Dispara o evento FetchWeather no WeatherBloc
                  if (context.mounted) {
                    context.read<WeatherBloc>().add(FetchWeather(position));
                  }
                } catch (e) {
                  // Trata erros de localização
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erro ao obter localização: $e')),
                    );
                  }
                }
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: size.height,
                  child: WeatherAllContents(
                    weather: weather!,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
