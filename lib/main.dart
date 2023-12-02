import 'package:feedback/config/constants/app_colors.dart';
import 'package:feedback/generated/l10n.dart';
import 'package:feedback/language_controller.dart';
import 'package:feedback/model/google_sheets_api.dart';
import 'package:feedback/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
          return GlobalLoaderOverlay(
            overlayColor: Colors.white,
            useDefaultLoading: false,
            overlayWidgetBuilder: (progress) {
              //ignored progress for the moment
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 80,
                      width: 80,
                      child: const CircularProgressIndicator(
                        color: AppColor.mainColor,
                        backgroundColor: Colors.grey,
                        strokeWidth: 6,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (progress != null)
                    Text(
                      progress,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    )
                ],
              );
            },
            child: MaterialApp(
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
            ),
          );
        });
  }
}
