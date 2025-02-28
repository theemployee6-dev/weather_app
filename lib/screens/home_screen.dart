import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../bloc/weather_bloc.dart';
import '../global/error_widget.dart';
import '../global/loading_progress.dart';
import '../utils/determine_position.dart';
import 'widgets/weather_blurred_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: FutureBuilder<Position>(
          future: DeterminePosition.determinePositionMethod(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingProgress();
            } else if (snapshot.hasError) {
              return ErrorSnapshotWidget(titleError: '${snapshot.error}');
            } else if (snapshot.hasData) {
              context.read<WeatherBloc>().add(FetchWeather(snapshot.data!));
              return WeatherBlurredBackground(
                position: snapshot.data!,
              );
            } else {
              return const ErrorSnapshotWidget(
                titleError: 'Nenhum dado carregado',
              );
            }
          }),
    );
  }
}
