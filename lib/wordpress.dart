import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WordPressNewsView extends StatefulWidget {
  @override
  _WordPressNewsViewState createState() => _WordPressNewsViewState();
}

class _WordPressNewsViewState extends State<WordPressNewsView> {
  final String wordpressApiUrl = 'https://people.com/';

  List<dynamic> newsList = [];

  Future<void> fetchWordPressNews() async {
    final response = await http.get(Uri.parse(wordpressApiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        newsList = data;
      });
    } else {
      print('Error al cargar las noticias de WordPress');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWordPressNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias de WordPress'),
      ),
      body: ListView.builder(
        itemCount: newsList.length > 3 ? 3 : newsList.length, // Mostrar solo las últimas 3 noticias
        itemBuilder: (context, index) {
          final news = newsList[index];
          final title = news['title']['rendered'];
          final content = news['excerpt']['rendered'];
          final link = news['link'];

          return ListTile(
            leading: Image.asset('assets/wordpress_logo.png'), // Reemplaza con la imagen del logo de WordPress
            title: Text(title),
            subtitle: Text(content),
            onTap: () {
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/acerca_de');
                },
                child: const Text('Ir a la vista de Acerca de')
              );
            },
          );
        },
      ),
    );
  }
}
