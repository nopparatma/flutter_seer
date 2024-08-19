import 'package:flutter/material.dart';
import 'package:flutter_seer/utils/translation_service.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService.loadTranslations();

  runApp(const MainApplication());
}
