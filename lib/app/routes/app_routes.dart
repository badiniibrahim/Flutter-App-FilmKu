part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static Future<String> get INITIAL async {
    return Routes.MAIN;
  }

  static const SPLASH = _Paths.SPLASH;
  static const MAIN = _Paths.MAIN;
  static const HOME = _Paths.HOME;
  static const DETAILS = _Paths.DETAILS;
  static const SAVED = _Paths.SAVED;
  static const POST = _Paths.POST;
  static showMovieDetail(int movieId) => "/details/$movieId";
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = "/splash";
  static const MAIN = '/main';
  static const HOME = '/home';
  static const DETAILS = '/details/:movieId';
  static const SAVED = '/saved';
  static const POST = '/post';
}
