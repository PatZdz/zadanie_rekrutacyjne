import 'package:flutter/material.dart';
import 'package:zadanie_rekrutacyjne/screens/Gallery/gallery_screen.dart' ;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


//Main code that runs the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Śląskie',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GalleryScreen(), 
    );
  }
}