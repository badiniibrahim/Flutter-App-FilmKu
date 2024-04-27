import 'package:get/get.dart';
import 'package:movie/app/data/movie.dart';

class HomeState {
  // isLoading
  final RxBool _isLoading = RxBool(false);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final RxList<Movie> _nowPlayingMovieList = <Movie>[].obs;
  set nowPlayingMovieList(value) => _nowPlayingMovieList.value = value;
  List<Movie> get nowPlayingMovieList => _nowPlayingMovieList;

  final RxInt _selectedGenre = RxInt(28);
  set selectedGenre(value) => _selectedGenre.value = value;
  int get selectedGenre => _selectedGenre.value;

  final RxList<Movie> _popularMovieList = <Movie>[].obs;
  set popularMovieList(value) => _popularMovieList.value = value;
  List<Movie> get popularMovieList => _popularMovieList;

  final RxList<String> _genreList = <String>[].obs;
  set genreList(value) => _genreList.value = value;
  List<String> get genreList => _genreList;
}
