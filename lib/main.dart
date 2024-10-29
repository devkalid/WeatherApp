import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapi/bloc/weather_bloc.dart';
import 'package:weatherapi/presentation/screens/main_screens/options.dart';


import 'locals/shared.dart';
import 'presentation/screens/main_screens/home_screen.dart';
import 'presentation/screens/start/onboarding_screen.dart';

import 'presentation/screens/start/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/home': (context) => BlocProvider(
              create: (context) => WeatherBloc()..add(FetchWeatherData()),
              child: HomeScreen(),
            ),
        '/options': (context) => Options(),
      },
    );
  }
}
