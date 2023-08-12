import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather/weather/weather_services.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    // create the local variable
    final formKey = GlobalKey<FormState>();
    final myController = TextEditingController();

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
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is empty!';
                      }
                      return null;
                    },
                    controller: myController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.5, color: Colors.black),
                      ),
                    ),
                  ),
                ),

                // text button
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // print(myController.text);
                      const FlutterSecureStorage()
                          .write(key: "value", value: myController.text);
                    }
                  },
                  child: const Text(
                    "Press",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )

            // TextButton(
            //   onPressed: () {
            //     WeatherService.getWeather("Kathmandu");
            //   },
            //   child: const Text("Get Weather"),
            // ),
          ],
        ),
      ),
    );
  }
}
