import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/app/data/movie.dart';

import '../controllers/home_controller.dart';

class NowShowing extends StatelessWidget {
  const NowShowing({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 300,
        child: ListView.separated(
          separatorBuilder: (context, index) => const VerticalDivider(
            color: Colors.transparent,
            width: 15,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.state.nowPlayingMovieList.length,
          itemBuilder: (context, index) {
            Movie movie = controller.state.nowPlayingMovieList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    child: Image.network(
                        "https://image.tmdb.org/t/p/original/${movie.backdropPath}"),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 180,
                  child: Text(
                    movie.title?.toUpperCase() ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'muli',
                    ),
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
