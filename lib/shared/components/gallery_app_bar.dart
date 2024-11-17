// gallery_app_bar.dart
import 'package:flutter/material.dart';
import 'package:zadanie_rekrutacyjne/screens/Gallery/video_background.dart';

class GalleryAppBar extends StatelessWidget {
  final bool isExpanded;

  const GalleryAppBar({super.key, required this.isExpanded});

  Widget _buildIcon(IconData iconData) {
    return Container(
      width: 40.0,
      height: 40.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.7),
      ),
      child: IconButton(
        icon: Icon(iconData),
        color: Colors.blue,
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      backgroundColor: isExpanded ? Colors.transparent : Colors.white,
      leading: _buildIcon(Icons.menu),
      actions: [
        _buildIcon(Icons.favorite_border),
        _buildIcon(Icons.search),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Film w tle
            const VideoBackground(),
            // Logo na środku
            Center(
              child: Image.asset(
                'lib/assets/images/logo_white.png', // Twoje duże logo
                height: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}