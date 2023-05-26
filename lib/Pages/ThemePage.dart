import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/SettingsController.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tema"),
      ),
      body: GetBuilder<SettingsController>(
        builder: (controller) {
          return Column(
            children: [
              ListTile(
                title: Text("Claro"),
                onTap: () => controller.setThemeMode(ThemeMode.light),
              ),
              ListTile(
                title: Text("Escuro"),
                onTap: () => controller.setThemeMode(ThemeMode.dark),
              ),
            ],
          );
        },
      ),
    );
  }
}
