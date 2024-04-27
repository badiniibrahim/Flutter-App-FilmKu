import 'package:flutter/material.dart';
import 'package:movie/movie.dart';

import 'app/routes/app_pages.dart';
import 'initializer.dart';

Future<void> main() async {
  await Initializer.init();

  final String initialRoute = await Routes.INITIAL;
  runApp(Movie(initialRoute: initialRoute));
}
