import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class UniversitiesView extends StatefulWidget {
  @override
  _UniversitiesViewState createState() => _UniversitiesViewState();
}

class _UniversitiesViewState extends State<UniversitiesView> {
  String countryName = 'Dominican Republic';
  List<dynamic> universities = [];

  Future<void> fetchUniversities() async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=$countryName'));


    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        universities = data;
      });
    } else {
      print('Error al cargar las universidades');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUniversities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universidades por País'),
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: universities.length,
              itemBuilder: (context, index) {
                final university = universities[index];
                return ListTile(
                  title: Text(university['name'] ?? 'Nombre no disponible'),
                  subtitle: Text('Dominio: ${university['domains'][0]}' ?? 'Dominio no disponible'),
                  onTap: () {
                    launchUrl(university['web_pages'][0]);
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/weather');
                        },
                        child: const Text('Ir a la vista de Clima'),


                    );

                  }
                );

              },
            ),
          ),
        ],
      ),
    );
  }
  }

