import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/Views/Search_View.dart';
import 'package:weather_app1/Widgets/Weather_info_body.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_state.dart';

import '../Widgets/NoWeatherBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)
              {
                return SearchView();
              }));
            },
            icon: Icon(Icons.search),),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit , WeatherState>(
        builder: (context, state) {
          if(state is WeatherInitialState ){
            return NoWeatherBody();
          }else if(state is WeatherLoadedState){
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          }else{
            return Text('oops there was an error');
          }
        },
       ),
    );
  }
}

