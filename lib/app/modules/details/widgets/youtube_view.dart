import 'package:flutter/material.dart';
import 'package:movie/app/modules/details/controllers/details_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeView extends StatelessWidget {
  const YoutubeView({super.key, required this.controller});

  final DetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 120),
      child: GestureDetector(
        onTap: () async {
          final youtubeUrl =
              'https://www.youtube.com/embed/${controller.state.movieDetail.trailerId}';
          if (await canLaunch(youtubeUrl)) {
            await launch(youtubeUrl);
          }
        },
        child: const Center(
          child: Column(
            children: [
              Icon(
                Icons.play_circle_outline,
                color: Colors.white,
                size: 65,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
