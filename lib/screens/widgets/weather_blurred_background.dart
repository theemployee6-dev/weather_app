import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherbloc1_app/bloc/weather_bloc.dart';

import 'blurred_background.dart';
import 'colored_circle.dart';
import 'weather_all_contents.dart';

class WeatherBlurredBackground extends StatelessWidget {
  const WeatherBlurredBackground({super.key, required this.position});

  final Position position;

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
                // Dispara o evento para buscar os dados de clima novamente
                context.read<WeatherBloc>().add(FetchWeather(position));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: size.height,
                  child: const WeatherAllContents(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
