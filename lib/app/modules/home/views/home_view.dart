import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:movie/app/data/movie.dart';
import 'package:movie/app/modules/home/widgets/genre.dart';
import 'package:movie/app/routes/app_pages.dart';
import 'package:movie/app/shared/networkImage/cached_network_image_widget.dart';
import 'package:movie/app/shared/seeMore/see_more.dart';
import 'package:movie/app/shared/vote_average.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder(
          init: HomeController(),
          initState: (_) {},
          builder: (_) {
            return Obx(
              () => controller.state.isLoading
                  ? Container()
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/images/Menu.png"),
                                const Text(
                                  "FilmKu",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'Merriweather',
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 17, 14, 71),
                                  ),
                                ),
                                Image.asset("assets/images/Notif.png")
                              ],
                            ),
                            const SizedBox(height: 30),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Now Showing",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Merriweather',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 17, 14, 71),
                                  ),
                                ),
                                SeeMore()
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 250,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const VerticalDivider(
                                        color: Colors.transparent),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount:
                                    controller.state.nowPlayingMovieList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Movie movie = controller
                                      .state.nowPlayingMovieList[index];
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    child: CachedNetworkImageWidget(
                                        backdropPath: movie.backdropPath ?? ""),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Popular",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Merriweather',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 17, 14, 71),
                                  ),
                                ),
                                SeeMore()
                              ],
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              child: ListView.builder(
                                physics: const PageScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    controller.state.popularMovieList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Movie movie = controller
                                      .state.nowPlayingMovieList[index];

                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.showMovieDetail(
                                          movie.id ?? 0));
                                    },
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          height: 150,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: CachedNetworkImageWidget(
                                                backdropPath:
                                                    movie.backdropPath ?? "",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 191,
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: 190,
                                                  child: Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    movie.title ?? "",
                                                    softWrap: true,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontFamily:
                                                          'Merriweather',
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 17, 14, 71),
                                                    ),
                                                  ),
                                                ),
                                                VoteAverage(
                                                    voteAverage:
                                                        movie.voteAverage ??
                                                            ""),
                                                const SizedBox(height: 5),
                                                Genre(
                                                  genreIds:
                                                      movie.genreIds ?? [],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
