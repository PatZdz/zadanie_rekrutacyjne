import 'package:flutter/material.dart';
import 'package:zadanie_rekrutacyjne/screens/Gallery/gallery_item.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;

    // Lista tekstów dla kafelków
    final List<String> texts = [
      'Dłuższe godziny zwiedzania Muzeum',
      'Wyjątkowe wydarzenia',
      'Niezapomniane atrakcje',
      'Regionalne smaki',
      'Przewodnik po Śląsku',
      'Odkryj nowe miejsca',
    ];

    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1, // Proporcje kafelków
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (index == 0) {
              // Zielony prostokąt "Zaplanuj podróż"
              return Container(
                height: 50, // Niższy kafelek
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Zaplanuj podróż',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            } else if (index == 1) {
              // Niebieski kwadrat "Szlaki"
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Szlaki',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            } else {
              // Reszta kafelków
              return GridItem(
                index: index - 2, // Dopasowanie indeksów do listy tekstów
                title: texts[(index - 2) % texts.length],
              );
            }
          },
          childCount: texts.length + 2, // Dodajemy 2 kafelki na początku
        ),
      ),
    );
  }
}