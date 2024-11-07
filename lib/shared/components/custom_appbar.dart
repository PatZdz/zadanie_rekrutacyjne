import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0, // Brak cienia
      leading: _buildIcon(Icons.menu), // Ikona menu po lewej stronie
      actions: [
        _buildIcon(Icons.favorite_border),
        _buildIcon(Icons.search),
      ],
    );
  }

  // Funkcja pomocnicza do tworzenia stylizowanych ikon o jednakowych rozmiarach kółek
  Widget _buildIcon(IconData iconData) {
    return Container(
      width: 40.0, // Stała szerokość dla kółka
      height: 40.0, // Stała wysokość dla kółka
      margin: const EdgeInsets.symmetric(horizontal: 8.0), // Marginesy po bokach
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.7), // Półprzezroczyste tło
      ),
      child: IconButton(
        icon: Icon(iconData),
        color: Colors.blue, // Niebieski kolor ikony
        onPressed: () {},
      ),
    );
  }
}