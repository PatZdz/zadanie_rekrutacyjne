import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Śląskie',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Aktualności',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Wydarzenia',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Eksploruj',
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}