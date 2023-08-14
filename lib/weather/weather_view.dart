import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather/weather/weather_model.dart';
import 'package:weather/weather/weather_services.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final storage = const FlutterSecureStorage();

  WeatherModel?weather; // to hold the retrieved weather data

  @override
  void initState() {
    super.initState();
    fetchStoredWeatherData(); // Fetch the stored weather data when the widget initializes
  }

  Future<void> fetchStoredWeatherData() async {
    final weatherDataString = await storage.read(key: "weatherData");
    if (weatherDataString != null) {
      final decodedData = jsonDecode(weatherDataString);
      setState(() {
        weather = WeatherModel.fromJson(decodedData);
      });
    }
  }

  // show the toast message
  void toastMessage(String smg) {
    Fluttertoast.showToast(
        msg: smg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                // text fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter the city name!';
                        }
                        return null;
                      },
                      controller: myController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),

                // text button
                TextButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var newWeather = await WeatherService.getWeather(myController.text);
                      if (newWeather == null) {
                        toastMessage("Weather data not available!");
                      } else {
                        final weatherDataString = jsonEncode(newWeather);
                        await storage.write(
                            key: "weatherData", value: weatherDataString);
                        setState(
                          () {
                            weather = newWeather;
                          },
                        );
                        toastMessage("Success");
                      }
                    }
                  },
                  child: const Text(
                    "Press",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            if (weather != null) // Display weather data if available
              Text("Temperature: ${weather!.main?.temp}"),
              Text("Temperature: ${weather!.main?.humidity}"),
              Text("Temperature: ${weather!.main?.pressure}"),
              Text("Temperature: ${weather!.main?.tempMin}"),
              Text("Temperature: ${weather!.main?.tempMax}"),
          ],
        ),
      ),
    );
  }
}
