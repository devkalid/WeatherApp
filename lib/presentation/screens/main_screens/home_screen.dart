import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapi/bloc/weather_bloc.dart';
import 'package:weatherapi/presentation/screens/main_screens/options.dart';



import 'package:weatherapi/presentation/widgets/custom_list_forecaste.dart';
import 'package:weatherapi/presentation/widgets/custom_row.dart';
import 'package:weatherapi/presentation/widgets/custom_stack.dart';
import 'package:weatherapi/presentation/widgets/custom_text_divider.dart';

import '../../widgets/location_and_date.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return "assets/images/1.png";
      case >= 300 && < 400:
        return "assets/images/2.png";
      case >= 500 && < 600:
        return "assets/images/3.png";
      case >= 600 && < 700:
        return "assets/images/4.png";
      case >= 700 && < 800:
        return "assets/images/5.png";
      case == 800:
        return "assets/images/6.png";
      case > 800 && <= 804:
        return "assets/images/7.png";
      default:
        return "assets/images/7.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.flash_on, size: 50, color: Colors.blue)),
        title: Text(
          "Weather App",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: Colors.blue),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Options(),
                  ),
                );
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is Weathersuccess) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  LocationAndDate(
                    location: state.weather.areaName.toString(),
                    day: DateFormat("EEEE").format(state.weather.date!),
                    date: DateFormat("dd").format(state.weather.date!),
                    month: DateFormat("MMMM").format(state.weather.date!),
                    time: DateFormat().add_jm().format(state.weather.date!),
                  ),
                  const SizedBox(height: 40),
                  CustomStack(
                    temp: '${state.weather.temperature!.celsius!.round()}',
                    desc: "${state.weather.weatherMain!.toUpperCase()}",
                    icon: getWeatherIcon(state.weather.weatherConditionCode!),
                  ),
                  const SizedBox(height: 40),
                  CustomRow(
                    temp_max: state.weather.tempMax.toString(),
                    temp_min: state.weather.tempMin.toString(),
                    feelLike: state.weather.tempFeelsLike.toString(),
                    sunrise: DateFormat().add_jm().format(state.weather.sunrise!),
                    sunset: DateFormat().add_jm().format(state.weather.sunset!),
                    windSpeed: "${state.weather.windSpeed.toString()} KM/H",
                  ),
                  // const SizedBox(height: 7),
                  CustomTextDivider(header: "Forecaste"),

                  Expanded(child: CustomListForecaste())
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator(color:  Colors.blue,));
          }
        },
      ),
    );
  }
}
