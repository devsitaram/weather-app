import 'package:flutter/material.dart';
import 'package:weather/weather/weather_services.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                WeatherService.getWeather("Kathmandu");
              },
              child: const Text("Get Weather"),
            ),
          ],
        ),
      ),
    );
  }
}
