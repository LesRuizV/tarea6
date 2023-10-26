import 'package:flutter/material.dart';
import 'toolbox_view.dart';
import 'Gender.dart';
import 'Age.dart';
import 'University.dart';
import 'weather.dart';
import 'wordpress.dart';
import 'Acerca.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 6',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ToolboxView(),
        '/gender_prediction': (context) => GenderPredictionView(),
        '/universities': (context) => UniversitiesView(),
        '/weather': (context) => WeatherView(),
        '/age': (context) => AgePredictionView(),
        '/wordpress': (context) => WordPressNewsView(),
        '/acerca_de': (context) => AcercaDeView()
      },
    );
  }
}
