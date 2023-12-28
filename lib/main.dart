import 'package:feedback/generated/l10n.dart';
import 'package:feedback/home.dart';
import 'package:feedback/language_controller.dart';
import 'package:feedback/model/google_sheets_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';

import 'model/demo_delegate.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // mention for func init in class UserSheetsAPI
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await FeedbackSheetAPI.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageController());
    return GetBuilder(
        init: controller,
        builder: (context) {
          return MaterialApp(
            home: const MyHomePage(),
            localizationsDelegates: const [
              L.delegate,
              DemoLocalizationsDelegate(),
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
