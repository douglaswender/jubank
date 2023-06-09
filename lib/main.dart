import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jubank/app/app.dart';
import 'package:jubank/app/firebase_options.dart';

import 'app/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Modular.setInitialRoute('/auth');
  runApp(ModularApp(
    module: AppModule(),
    child: const App(),
  ));
}
