import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GenderPredictionView extends StatefulWidget {
  @override
  _GenderPredictionViewState createState() => _GenderPredictionViewState();
}

class _GenderPredictionViewState extends State<GenderPredictionView> {
  String name = '';
  String gender = '';
  Color backgroundColor = Colors.white;

  void predictGender() async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final detectedGender = data['gender'];

      setState(() {
        gender = detectedGender;
        backgroundColor = (gender == 'Hombre') ? Colors.blue : Colors.pink;
      });
    } else {
      print('Error al cargar los datos de género');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicción de Género'),
      ),
      backgroundColor: backgroundColor,
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
              onPressed: predictGender,
              child: Text('Predecir Género'),
            ),
            Text('Género: $gender'),
            ElevatedButton(
              onPressed: () {

                Navigator.pushNamed(context, '/age');
              },
              child: Text('Ir a predicción de edad'),
            ),
            ElevatedButton(
              onPressed: () {

                Navigator.pop(context);
              },
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
