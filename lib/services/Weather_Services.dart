import 'package:dio/dio.dart';
import 'package:weather_app1/Models/Weather_Models.dart';

class WeatherService{
 final String baseUrl = 'http://api.weatherapi.com';
 final String apiKey = 'c7b0316185a94de69aa114037231210';

  final Dio dio;

  WeatherService(this.dio);

Future<WeatherModel> getCurrentWeather({required String cityName}) async{
 try {
  Response response = await dio.get(
      '$baseUrl/v1/forecast.json?key=$apiKey&q=$cityName&days=10');
  WeatherModel weatherModel = WeatherModel.fromjson(response.data);
  return weatherModel;

 }on DioException catch(e){
  final String errMessage = e.response?.data['error']['message'] ?? 'oops there was an error, try later';
  throw Exception(errMessage);

 }catch(e){
  throw Exception('oops there was an error, try later');
 }
}
}