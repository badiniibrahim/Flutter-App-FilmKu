import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie/app/core/api/api_provider.dart';
import 'package:movie/app/core/api/i_provider.dart';

class MovieDetailProvider extends IProvider<Response> {
  @override
  String get endpoint => "/movie";

  Future<Response> getYoutubeId(int movieId) async {
    return await ApiProvider.instance.get(
      endpoint:
          "$endpoint/$movieId/videos?api_key=${dotenv.env['API_KEY']}&language=fr",
    );
  }

  Future<Response> getMovieImage(int movieId) async {
    return await ApiProvider.instance.get(
      endpoint:
          "$endpoint/$movieId/images?api_key=${dotenv.env['API_KEY']}&language=fr",
    );
  }

  Future<Response> getMovieDetail(int movieId) async {
    return await ApiProvider.instance.get(
      endpoint:
          "$endpoint/$movieId?api_key=${dotenv.env['API_KEY']}&language=fr",
    );
  }
}
