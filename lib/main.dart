import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/Views/Home_Views.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder:(context) => BlocBuilder<GetWeatherCubit,WeatherState>(
          builder: (context,state) {
            return MaterialApp(
                theme: ThemeData(
                primarySwatch:getThemeColor(
                 BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weathercondition,
              ) ,
            ),
            debugShowCheckedModeBanner: false,
            home:HomeView(),
          );
            },
        ),
      ),
    );
  }
}
 MaterialColor getThemeColor(String? condition) {
  if(condition==null){
    return Colors.blue;
  }
switch (condition) {
case 'Sunny':
case 'Clear':
return Colors.orange;
case 'Partly cloudy':
return Colors.yellow;
case 'Cloudy':
case 'Overcast':
return Colors.grey;
case 'Mist':
case 'Fog':
case 'Freezing fog':
return Colors.blueGrey;
case 'Patchy rain possible':
case 'Patchy snow possible':
case 'Patchy sleet possible':
case 'Patchy freezing drizzle possible':
case 'Patchy light drizzle':
case 'Light drizzle':
case 'Freezing drizzle':
case 'Heavy freezing drizzle':
case 'Patchy light rain':
case 'Light rain':
case 'Moderate rain at times':
case 'Moderate rain':
case 'Heavy rain at times':
case 'Heavy rain':
case 'Light freezing rain':
case 'Moderate or heavy freezing rain':
case 'Light sleet':
case 'Moderate or heavy sleet':
case 'Patchy light snow':
case 'Light snow':
case 'Patchy moderate snow':
case 'Moderate snow':
case 'Patchy heavy snow':
case 'Heavy snow':
case 'Ice pellets':
case 'Light rain shower':
case 'Moderate or heavy rain shower':
case 'Torrential rain shower':
case 'Light sleet showers':
case 'Moderate or heavy sleet showers':
case 'Light snow showers':
case 'Moderate or heavy snow showers':
case 'Light showers of ice pellets':
case 'Moderate or heavy showers of ice pellets':
case 'Patchy light rain with thunder':
case 'Moderate or heavy rain with thunder':
case 'Patchy light snow with thunder':
case 'Moderate or heavy snow with thunder':
return Colors.lightBlue;
case 'Thundery outbreaks possible':
  case 'Blowing snow':
  case 'Blizzard':
return Colors.deepPurple;
default:
return Colors.blue;
}
}