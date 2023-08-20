import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather/weather/weather_model.dart';
import 'package:weather/weather/weather_services.dart';
import 'package:http/http.dart' as http;

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  // final storage = const FlutterSecureStorage();

  WeatherModel? weather; // to hold the retrieved weather data

  Future apicall() async {
    var newWeather = await WeatherService.getWeather(myController.text);
    setState(
      () {
        weather = newWeather;
      },
    );
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  // Future<void> fetchStoredWeatherData() async {
  //   final weatherDataString = await storage.read(key: "weatherData");
  //   if (weatherDataString != null) {
  //     final decodedData = jsonDecode(weatherDataString);
  //     setState(() {
  //       weather = WeatherModel.fromJson(decodedData);
  //     });
  //   }
  // }

  // show the toast message
  // void toastMessage(String smg) {
  //   Fluttertoast.showToast(
  //       msg: smg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: myController,
              onChanged: (value) {
                apicall();
              },
            ),
            Text(weather!.main!.pressure.toString()),
          ],
        ),
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Row(
        //       children: [
        //         // text fields
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 40),
        //           child: Form(
        //             key: formKey,
        //             child: TextFormField(
        //               validator: (value) {
        //                 if (value == null || value.isEmpty) {
        //                   return 'Enter the city name!';
        //                 }
        //                 return null;
        //               },
        //               controller: myController,
        //               decoration: const InputDecoration(
        //                 enabledBorder: OutlineInputBorder(
        //                   borderSide:
        //                       BorderSide(width: 0.5, color: Colors.black),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),

        //         // text button
        //         TextButton(
        //           onPressed: () async {
        //             if (formKey.currentState!.validate()) {
        //               initState();
        //             }
        //           },
        //           child: const Text(
        //             "Press",
        //             style: TextStyle(fontSize: 20),
        //           ),
        //         ),
        //       ],
        //     ),
        //     // Display weather data if available
        //     // if (weather != null){
        //     // Text("Temperature: ${weather!.main?.temp}"),
        //     // Text("Humidity: ${weather!.main?.humidity}"),
        //     // Text("Pressure: ${weather!.main?.pressure}"),
        //     // Text("Minimum Temp: ${weather!.main?.tempMin}"),
        //     // Text("Maximum Temp: ${weather!.main?.tempMax}"),
        //     // }
        //   ],
        // ),
      ),
    );
  }
}
