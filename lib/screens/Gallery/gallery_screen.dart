// gallery_screen.dart
import 'package:flutter/material.dart';
import 'package:zadanie_rekrutacyjne/shared/components/custom_bottom_navbar.dart';
import 'package:zadanie_rekrutacyjne/shared/components/gallery_app_bar.dart';
import 'gallery_grid.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarExpanded = true;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double threshold = MediaQuery.of(context).size.height * 0.3;
      if (_scrollController.offset > threshold && _isAppBarExpanded) {
        setState(() {
          _isAppBarExpanded = false;
        });
      } else if (_scrollController.offset <= threshold && !_isAppBarExpanded) {
        setState(() {
          _isAppBarExpanded = true;
        });
      }
    });
  }

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
          GalleryAppBar(isExpanded: _isAppBarExpanded),
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
                    child: const Text('Płatne'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
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