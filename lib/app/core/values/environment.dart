import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  // ignore: unused_field
  static const String _stgEnvFile = ".env.staging";
  static const String _prodEnvFile = ".env.production";

  static String get fileName => kReleaseMode ? _prodEnvFile : _stgEnvFile;
  static String get apiUrl => dotenv.env['API_URL']!;
}
