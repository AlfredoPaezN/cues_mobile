import 'package:firebase_core/firebase_core.dart';
import 'package:virtual_cues/bootstrap.dart';
import 'package:virtual_cues/firebase_options.dart';
import 'package:virtual_cues/injection_container.dart';
import 'package:virtual_cues/modules/presentation/app/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initLocator();
  await bootstrap(() => const App());
}
