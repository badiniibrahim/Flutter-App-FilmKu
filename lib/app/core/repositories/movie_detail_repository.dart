import 'package:dio/dio.dart';
import 'package:movie/app/core/api/i_repository.dart';
import 'package:movie/app/core/providers/movie_detail_provider.dart';
import 'package:movie/app/data/movie_detail.dart';

class MovieDetailRepository extends IRepository<Response> {
  @override
  MovieDetailProvider get provider => MovieDetailProvider();

  Future<MovieDetail> getMovieDetail(int movieId) async {
    final response = await provider.getMovieDetail(movieId);
    MovieDetail movieDetail = MovieDetail.fromJson(response.data);
    movieDetail.trailerId = await getYoutubeId(movieId);
    return movieDetail;
  }

  Future<String> getYoutubeId(int movieId) async {
    final response = await provider.getYoutubeId(movieId);
    var youtubeId = response.data['results'].length == 0
        ? ""
        : response.data['results'][0]['key'];

    return youtubeId;
  }
}
