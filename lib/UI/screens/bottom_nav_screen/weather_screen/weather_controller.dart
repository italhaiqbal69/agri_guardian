import 'dart:convert';

import 'package:agri_guardian/models/weather_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WeatherController extends GetxController {
  fetchWeather() async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=34.0353675&lon=71.5879454&appid=7d9040cbef459176d1f2a53d09523266"));
    if(response.statusCode==200){
      var json=jsonDecode(response.body);
      return WeatherModel.fromJson(json);
    }else{
      throw Exception('failed to load weather');
    }
  }

}
