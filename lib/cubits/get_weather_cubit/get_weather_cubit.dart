import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_state.dart';

import '../../Models/Weather_Models.dart';
import '../../services/Weather_Services.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(WeatherInitialState());
   WeatherModel? weatherModel;
  getWeather({required String cityName})async{
    try {
       weatherModel=
                   await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    }catch(e){
      emit(WeatherFailureState());
    }
}
}