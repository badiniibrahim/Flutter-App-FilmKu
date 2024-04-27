import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/app/modules/details/controllers/details_controller.dart';
import 'package:movie/app/modules/details/widgets/youtube_view.dart';
import 'package:movie/app/shared/vote_average.dart';

class MovieDetailItem extends StatelessWidget {
  const MovieDetailItem({
    super.key,
    required this.controller,
  });

  final DetailsController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          ClipPath(
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/original/${controller.state.movieDetail.backdropPath}',
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Platform.isAndroid
                    ? const CircularProgressIndicator()
                    : const CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img_not_found.jpg'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      FluentIcons.settings_24_regular,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              YoutubeView(controller: controller),
              const SizedBox(height: 150),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          controller.state.movieDetail.title ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Merriweather',
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: Color.fromARGB(255, 17, 14, 71),
                          ),
                        ),
                        Image.asset(
                          "assets/images/saved.png",
                          color: Colors.black,
                        )
                      ],
                    ),
                    VoteAverage(
                      voteAverage:
                          controller.state.movieDetail.voteAverage ?? "",
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Date de sortie',
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'Merriweather',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 17, 14, 71),
                                )),
                            Text(
                              controller.state.movieDetail.releaseDate ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Merriweather',
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color.fromARGB(255, 17, 14, 71),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Durée',
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'Merriweather',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 17, 14, 71),
                                )),
                            Text(
                              controller.state.movieDetail.runtime ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Merriweather',
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color.fromARGB(255, 17, 14, 71),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Budget',
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'Merriweather',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 17, 14, 71),
                                )),
                            Text(
                              controller.state.movieDetail.budget ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Merriweather',
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color.fromARGB(255, 17, 14, 71),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Merriweather',
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color.fromARGB(255, 17, 14, 71),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      controller.state.movieDetail.overview ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Merriweather',
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color.fromARGB(255, 17, 14, 71),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
