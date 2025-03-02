import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weatherbloc1_app/src/weather_app/bloc_location/bloc/location_bloc.dart';

import 'src/weather_app/bloc_weather/bloc/weather_bloc.dart';
import 'src/weather_app/data/adapters/weather_adapter.dart';
import 'src/weather_app/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Hive
  await Hive.initFlutter();

  // Registra o adaptador
  Hive.registerAdapter(WeatherAdapterAdapter());

  // Abre a Box para armazenar os dados
  final weatherBox = await Hive.openBox<WeatherAdapter>('weatherBox');

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp(
            weatherBox: weatherBox,
          )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.weatherBox});

  final Box<WeatherAdapter> weatherBox; // Box já aberta

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => LocationBloc()),
        BlocProvider(create: (context) => WeatherBloc(weatherBox: weatherBox)),
      ], child: const HomeScreen()),
    );
  }
}
