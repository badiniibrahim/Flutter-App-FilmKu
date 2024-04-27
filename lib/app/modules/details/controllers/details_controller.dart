import 'package:get/get.dart';
import 'package:movie/app/core/api/i_controller.dart';
import 'package:movie/app/core/repositories/movie_detail_repository.dart';
import 'package:movie/app/modules/details/state.dart';

class DetailsController extends GetxController with IController {
  final MovieDetailState state = MovieDetailState();
  final MovieDetailRepository _repository = MovieDetailRepository();

  Future<void> getMovieDetail(int movieId) async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response = await _repository.getMovieDetail(movieId);
        state.movieDetail = response;
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }
}
