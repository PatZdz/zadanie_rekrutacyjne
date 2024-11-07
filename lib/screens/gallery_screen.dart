import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../shared/components/custom_appbar.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('lib/assets/movies/film.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            // Tryb poziomy: film zajmuje określoną wysokość, a grid wyświetla się poniżej
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Kontener z filmem o stałej wysokości
                  _controller.value.isInitialized
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5, // Film zajmuje połowę wysokości ekranu
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: _controller.value.size.width,
                              height: _controller.value.size.height,
                              child: VideoPlayer(_controller),
                            ),
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
                  const SizedBox(height: 16), // Dodany odstęp między filmem a GridView
                  // GridView poniżej filmu
                  _buildGallery(),
                ],
              ),
            );
          } else {
            // Tryb pionowy
            return Column(
              children: [
                // Kontener z filmem o proporcjach filmu (orientacja pionowa)
                _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : const Center(child: CircularProgressIndicator()),
                // Dolna część ekranu z galerią (orientacja pionowa)
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildGallery(),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildGallery() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Polecane',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        _buildResponsiveGrid(),
      ],
    );
  }

  Widget _buildResponsiveGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(), // GridView nie przewija się sam, przewija go SingleChildScrollView
          shrinkWrap: true, // Dopasowanie rozmiaru do zawartości
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.grey.shade300,
              child: Center(child: Text('Obiekt $index')),
            );
          },
        );
      },
    );
  }
}