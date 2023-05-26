import 'package:events_app/Bindigs/MyBinding.dart';
import 'package:events_app/Controllers/LoginController.dart';
import 'package:events_app/Pages/Container/ContainerPage.dart';
import 'package:events_app/Pages/LoginPage.dart';
import 'package:events_app/Routers/AppRouters.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Services/Translation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await TranslationService.init();
  await GetStorage.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      initialBinding: MyBinding(),
      translations: TranslationService(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      initialRoute: AppRoutes.SPLASH,
      home: GetBuilder<LoginController>(
        builder: (controller) {
          return controller.isLoggIn.value ? ContainerPage() : LoginPage();
        },
      ),
      //getPages: AppRoutes.pages,
    );
  }
}
