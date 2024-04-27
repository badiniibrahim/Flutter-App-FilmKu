import 'package:dio/dio.dart';
import 'package:movie/app/core/api/i_repository.dart';
import 'package:movie/app/data/movie.dart';

import '../providers/home_provider.dart';

class HomeRepository extends IRepository<Response> {
  @override
  HomeProvider get provider => HomeProvider();

  Future<List<Movie>> getNowPlayingMovie() async {
    final response = await provider.getNowPlayingMovie();
    var movies = response.data['results'] as List;
    List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }

  Future<List<Movie>> getPopularMovie() async {
    final response = await provider.getAll();
    var movies = response.data['results'] as List;
    List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }
}
