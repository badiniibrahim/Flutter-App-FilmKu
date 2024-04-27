import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:movie/app/core/api/i_controller.dart';
import 'package:movie/app/core/repositories/home_repository.dart';
import 'package:movie/app/modules/home/state.dart';

class HomeController extends GetxController with IController {
  final HomeState state = HomeState();
  final HomeRepository _repository = HomeRepository();

  Future<void> getNowPlayingMovie() async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response = await _repository.getNowPlayingMovie();
        final responsePopular = await _repository.getPopularMovie();
        state.popularMovieList = responsePopular;
        state.nowPlayingMovieList = response;
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }

  Future<void> findGenreNames(List<int> genreIds, String jsonFilePath) async {
    var fileContent = await File(jsonFilePath).readAsString();
    var jsonData = jsonDecode(fileContent);

    List<dynamic> genres = jsonData['genres'];

    List<String> genreNames = genres.where((genre) {
      return genreIds.contains(genre['id']);
    }).map((genre) {
      return genre['name'].toString();
    }).toList();
    state.genreList = genreNames;
  }

  @override
  void onInit() {
    getNowPlayingMovie();
    super.onInit();
  }
}
