import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/core/values/environment.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      await _initEnvironment();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initEnvironment() async {
    // Load Environment variables
    await dotenv.load(fileName: Environment.fileName);
  }
}
