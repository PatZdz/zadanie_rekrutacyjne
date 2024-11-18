import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final int index;
  final String title; // Dodane pole dla tekstu

  const GridItem({super.key, required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Obraz w tle
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'lib/assets/images/image_$index.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        // Ikona ulubionych
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.favorite_border),
              iconSize: 20, // Dopasuj rozmiar ikony do proporcji
              padding: EdgeInsets.zero, // Usunięcie domyślnego wypełnienia
              alignment: Alignment.center, // Wyrównanie ikony w środku
              onPressed: () {},
            ),
          ),
        ),
        // Tekst na dole z tłem
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title, // Wyświetlanie tekstu
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
