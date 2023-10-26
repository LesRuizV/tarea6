import 'package:flutter/material.dart';

class AcercaDeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/mi_foto.jpeg'),
              radius: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Leslie Ruiz',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'lesliaruiz06@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
