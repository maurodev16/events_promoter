import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Repositories/IRepositorySettings.dart';

class SettingsController extends GetxController {
  final IRepositorySettings repository;
  SettingsController(this.repository);

  RxBool notificationsEnabled = true.obs;
  RxString language = "pt_BR".obs;
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  void setNotifications(bool value) {
    notificationsEnabled.value = value;
    update();
  }

  void setLanguage(String value) {
    language.value = value;
    Get.updateLocale(Locale(value));
    update();
  }

  void setThemeMode(ThemeMode value) {
    themeMode.value = value;
    Get.changeThemeMode(value);
    update();
  }
}
