import 'package:ai_data/core/app.dart';
import 'package:ai_data/core/bootstrap.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(
    () => const App(),
  );
}
