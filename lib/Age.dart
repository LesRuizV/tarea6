import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgePredictionView extends StatefulWidget {
  @override
  _AgePredictionViewState createState() => _AgePredictionViewState();
}

class _AgePredictionViewState extends State<AgePredictionView> {
  String name = '';
  String ageGroup = '';
  int age = 0;

  void predictAge() async {
    final response = await http.get(Uri.parse('https://api.agify.io/?name=$name'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final predictedAge = data['age'];

      setState(() {
        age = predictedAge;
        if (age < 18) {
          ageGroup = 'joven';
        } else if (age < 60) {
          ageGroup = 'adulto';
        } else {
          ageGroup = 'viejo';
        }
      });
    } else {
      print('Error al cargar los datos de edad');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicción de Edad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            ElevatedButton(
              onPressed: predictAge,
              child: Text('Predecir Edad'),
            ),
            Text('Edad: $age años'),
            Text('Estado de Edad: $ageGroup'),
            Image.asset(ageGroup.isNotEmpty ? 'assets/$ageGroup.jpg' : 'assets/placeholder.jpg'),

            ElevatedButton(
              onPressed: () {

                Navigator.pushNamed(context, '/universities');
              },
              child: Text('Ir a Universidades'),
            ),
          ],
        ),
      ),
    );
  }
}
