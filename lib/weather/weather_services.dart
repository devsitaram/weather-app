import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/weather/weather_model.dart';

class WeatherService {
  static Future<dynamic> getWeather(String city) async {
    final response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=3222fcec2d69fff74f7464338223c559"));
    if (response.statusCode == 200) {
      var newRespons = WeatherModel.fromJson(jsonDecode(response.body));
      // print(newRespons.main?.temp);
      // print(newRespons.weather?[0].main);
      return newRespons;
    } else {
      print("API call is failed.");
    }
  }
}
