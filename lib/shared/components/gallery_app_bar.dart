// gallery_app_bar.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GalleryAppBar extends StatefulWidget {
  final ScrollController scrollController;

  const GalleryAppBar({Key? key, required this.scrollController}) : super(key: key);

  @override
  _GalleryAppBarState createState() => _GalleryAppBarState();
}

class _GalleryAppBarState extends State<GalleryAppBar> {
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
    final double appBarHeight = MediaQuery.of(context).size.height * 0.5;

    return SliverAppBar(
      pinned: true,
      expandedHeight: appBarHeight,
      backgroundColor: Colors.white,
      leading: _buildIcon(Icons.menu),
      actions: [
        _buildIcon(Icons.favorite_border),
        _buildIcon(Icons.search),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Obliczanie procentu przewinięcia
            double percentage = (constraints.biggest.height - kToolbarHeight) /
                (appBarHeight - kToolbarHeight);
            percentage = percentage.clamp(0.0, 1.0);

            // Zwiększenie rozmiaru logo
            double maxLogoSize = 200; // Zwiększony początkowy rozmiar logo
            double minLogoSize = maxLogoSize * 0.5; // Końcowy rozmiar to połowa początkowego
            double logoSize =
                minLogoSize + (maxLogoSize - minLogoSize) * percentage;

            // Pozycjonowanie logo na środku ekranu
            double logoPositionTop = (appBarHeight - logoSize) / 2;

            // Przezroczystość tła wideo
            double videoOpacity = percentage;

            // Przezroczystość białego tła
            double backgroundOpacity = 1 - percentage;

            return Stack(
              fit: StackFit.expand,
              children: [
                // Wideo w tle
                Positioned.fill(
                  child: Opacity(
                    opacity: videoOpacity,
                    child: _controller.value.isInitialized
                        ? FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: _controller.value.size.width,
                              height: _controller.value.size.height,
                              child: VideoPlayer(_controller),
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                ),
                // Białe tło pojawiające się podczas przewijania
                Positioned.fill(
                  child: Container(
                    color: Colors.white.withOpacity(backgroundOpacity),
                  ),
                ),
                // Logo na środku ekranu
                Positioned(
                  top: logoPositionTop,
                  left: (MediaQuery.of(context).size.width - logoSize) / 2,
                  child: Image.asset(
                    'lib/assets/images/logo_white.png',
                    width: logoSize,
                    height: logoSize,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}