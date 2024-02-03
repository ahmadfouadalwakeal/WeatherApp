import 'package:weather_app1/Models/Weather_Models.dart';

class WeatherState{}

class WeatherInitialState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState{

}