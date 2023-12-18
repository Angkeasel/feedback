import 'package:feedback/generated/l10n.dart';
import 'package:feedback/language_controller.dart';
import 'package:feedback/model/google_sheets_api.dart';
import 'package:feedback/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // mention for func init in class UserSheetsAPI
  await FeedbackSheetAPI.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageController());
    return GetBuilder<LanguageController>(
        init: controller,
        builder: (_) {
          return MaterialApp(
            home: const SplashScreen(),
            localizationsDelegates: const [
              L.delegate,
              //DemoLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: L.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            locale: controller.locale.value,
          );
        });
  }
}
