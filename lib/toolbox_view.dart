import 'package:flutter/material.dart';
import 'Gender.dart';

class ToolboxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caja de Herramientas'),
          leading: Image.asset('assets/mi_foto.png')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/cajadeh.png'), // Tu imagen de caja de herramientas
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navega a la vista de predicción de género
                Navigator.pushNamed(context, '/gender_prediction');
              },
              child: Text('Ir a Predicción de Género'),
            ),
          ],
        ),
      ),
    );
  }
}
