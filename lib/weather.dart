import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherView extends StatefulWidget {
  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  String apiKey = 'bc4a55efd8dd969ac6ff28077333c818';
  String city = 'Santo Domingo,DO';
  String temperature = 'Cargando...';
  String description = '';

  Future<void> getWeatherData() async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final temp = data['main']['temp'];
      final desc = data['weather'][0]['description'];

      setState(() {
        temperature = '${temp.toStringAsFixed(1)}°C';
        description = desc;
      });
    } else {
      print('Error al cargar los datos del clima');
    }
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima en la República Dominicana'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Temperatura: $temperature'),
            Text('Descripción: $description'),

          ElevatedButton(
            onPressed: () {
              // Navega a la vista de predicción de género
              Navigator.pushNamed(context, '/');
            },
            child: Text('Siguiente vista'),

          ),
          ],
        ),
      ),
    );
  }
}
