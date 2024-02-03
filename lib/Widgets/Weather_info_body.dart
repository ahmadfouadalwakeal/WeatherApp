import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/Models/Weather_Models.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app1/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather,});

  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel=BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.weathercondition),
            getThemeColor(weatherModel.weathercondition)[300]!,
            getThemeColor(weatherModel.weathercondition)[50]!,
          ],
          begin: Alignment.topCenter,
          end:Alignment.bottomCenter,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
          weatherModel.cityname,
          style: TextStyle(fontSize:32,fontWeight: FontWeight.bold),),
          Text(
            'Update At ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: TextStyle(fontSize:24,),
          ),
          SizedBox(height: 32,)  ,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Image.network(
                  "https:${weatherModel.image}",
              ),
              Text(
                weatherModel.temp.toString(),
                style: TextStyle(fontSize:32,fontWeight: FontWeight.bold),
              ),
              Column(children: [
                Text(
                  'MaxTemp: ${weatherModel.maxtemp.round()}',
                  style: TextStyle(fontSize:16,),
                ),
                Text(
                  'MinTemp: ${weatherModel.mintemp.round()}',
                  style: TextStyle(fontSize:16,),
                ),
              ],),
            ],),
            const SizedBox(height: 32,),
            Text(
              weatherModel.weathercondition,style:
             TextStyle(fontSize:32,fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ),
    );
  }
}
