import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapi/bloc/forecaste_bloc/forecaste_bloc.dart';
import 'package:weatherapi/bloc/weather_bloc/weather_bloc.dart';
import 'package:weatherapi/constants/functions.dart';

class CustomListForecaste extends StatelessWidget {
  const CustomListForecaste({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ForecasteBloc>(context);
    return BlocBuilder<ForecasteBloc, ForecasteState>(
        builder: (context, state) {
      if (state is WeatherForecasteSuccess) {
        return Container(
          height: 160,
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: ListView.separated(
              separatorBuilder: (context, no_) => Container(width: 20,),
              scrollDirection: Axis.horizontal,
              itemCount: state.forecaste.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    BlocProvider.of<WeatherBloc>(context)..getWeatherFromForcast(state.forecaste[index])..add(UpdateForecastData());
                  },
                  child: CustomCardList(
                    image:
                        "${getWeatherIcon(state.forecaste[index].weatherConditionCode!)}",
                    tittle:
                        "${DateFormat("dd/MM").add_jm().format(state.forecaste[index].date!)}",
                    value: "${state.forecaste[index].temperature}",
                  ),
                );
              }),
        );
      } else {
        return Container(
          margin: EdgeInsets.all(25),
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      }
    });
  }
}

class CustomCardList extends StatelessWidget {
  final String image;
  final String tittle;
  final String value;

  CustomCardList(
      {required this.image, required this.tittle, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFe2e7fa),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('${image}'),
          FittedBox(
            child: Text(
              "${tittle}",
            ),
            fit: BoxFit.scaleDown,
          ),
          Text("$value")
        ],
      ),
    );
  }
}
