import 'package:events_app/Utils/Const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/SettingsController.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SettingsController>(
        builder: (controller) {
          return Column(
            children: [
              ListTile(
                title: Text("Portuguese (Brazil)"),
                onTap: () => controller.setLanguage("pt_BR"),
                leading: Icon(
                  Icons.language,
                  color: preto_forte,
                ),
              ),
              Divider(),
              ListTile(
                title: Text("German (Germany)"),
                onTap: () => controller.setLanguage("de_DE"),
                leading: Icon(
                  Icons.language,
                  color: preto_forte,
                ),
              ),
              Divider(),
              ListTile(
                title: Text("English"),
                onTap: () => controller.setLanguage("en_US"),
                leading: Icon(
                  Icons.language,
                  color: preto_forte,
                ),
              ),
              Divider(),
              ListTile(
                title: Text("Spanish"),
                onTap: () => controller.setLanguage("es_ES"),
                leading: Icon(
                  Icons.language,
                  color: preto_forte,
                ),
              ),
              Divider(),
              ListTile(
                title: Text("French"),
                onTap: () => controller.setLanguage("fr_FR"),
                leading: Icon(
                  Icons.language,
                  color: preto_forte,
                ),
              ),
              Divider(),
              ListTile(
                title: Text("Russian"),
                onTap: () => controller.setLanguage("ru_RU"),
                leading: Icon(
                  Icons.language,
                  color: preto_forte,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
