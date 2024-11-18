import 'package:flutter/material.dart';
import 'package:zadanie_rekrutacyjne/shared/components/custom_bottom_navbar.dart';
import 'package:zadanie_rekrutacyjne/shared/components/gallery_app_bar.dart';
import 'gallery_grid.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Dodaj tutaj logikę nawigacji, jeśli jest potrzebna
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          GalleryAppBar(scrollController: _scrollController),
          // Napis "Polecane"
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Polecane',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Przyciski "Płatne" i "Bezpłatnie"
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  ElevatedButton(
                    
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 185, 142, 236),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Płatne'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(

                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.grey[850],
                    ),
                    child: const Text('Bezpłatnie'),
                  ),
                ],
              ),
            ),
          ),
          // Siatka kafelków
          const GalleryGrid(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavBarTapped,
      ),
    );
  }
}