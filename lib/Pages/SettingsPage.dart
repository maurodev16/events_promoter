import 'package:events_app/Controllers/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/RegisterController.dart';
import '../Controllers/SettingsController.dart';
import '../Utils/Const.dart';

class SettingsPage extends GetView<LoginController> {
  final SettingsController settingController = Get.find();
  final LoginController loginController = Get.find();
  final RegisterController controllerRegister = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            children: [
              ListTile(
                title: Text(
                  "Language",
                  style: TextStyle(
                    fontSize: 15,
                    color: preto_forte,
                  ),
                ),
                subtitle: Text(
                  "Select your Language",
                  style: TextStyle(
                    fontSize: 15,
                    color: preto_forte,
                  ),
                ),
                trailing: Icon(
                  Icons.language_outlined,
                  color: preto_forte,
                ),
                onTap: () => Get.toNamed("/language_page"),
              ),
              // Divider(),
              // ListTile(
              //   title: Text("Tema"),
              //   subtitle: Text("Select a Theme"),
              //   trailing: Icon(Icons.arrow_forward_ios),
              //   onTap: () => Get.toNamed("/theme_page"),
              // ),
              Divider(),
              loginController.isLoggIn.value
                  ? ListTile(
                      title: Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 15,
                          color: preto_forte,
                        ),
                      ),
                      subtitle: Text(
                        "turn on notifications",
                        style: TextStyle(
                          fontSize: 15,
                          color: preto_forte,
                        ),
                      ),
                      trailing: Switch(
                        value: settingController.notificationsEnabled.value,
                        onChanged: (value) =>
                            settingController.setNotifications(value),
                      ),
                    )
                  : Container(),
              loginController.isLoggIn.value ? Divider() : Container(),
              loginController.isLoggIn.value
                  ? ListTile(
                      title: Text(
                        "Exit",
                        style: TextStyle(
                          fontSize: 15,
                          color: preto_forte,
                        ),
                      ),
                      subtitle: Text(
                        "Exit the application",
                        style: TextStyle(
                          fontSize: 15,
                          color: preto_forte,
                        ),
                      ),
                      trailing: Icon(Icons.exit_to_app, color: preto_forte),
                      onTap: () async {
                        Get.defaultDialog(
                            title: "Logout",
                            onCancel: () => Get.back(),
                            onConfirm: () async {
                              loginController.logout();
                              loginController.isLoggingOut.value = true;
                              // verificar se o logout foi concluído com sucesso antes de ir para a próxima tela
                              while (!loginController.isLogoutCompleted.value) {
                                await Future.delayed(
                                  Duration(seconds: 1),
                                  () => LoadingWidget(),
                                );
                              }

                              Get.back();

                              loginController.isLoggingOut.value =
                                  false; // esconder o LoadingWidget
                              loginController
                                  .resetLogoutStatus(); // redefinir as variáveis de status do logout
                            });
                      },
                    )
                  : ListTile(
                      title: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 15,
                          color: preto_forte,
                        ),
                      ),
                      trailing: Icon(Icons.login, color: preto_forte),
                      onTap: () async {
                        Get.toNamed('/login_page');
                      },
                    ),
            ],
          ),
        ),
        loginController.isLogoutCompleted.value
            ? LoadingWidget()
            : SizedBox.shrink(),
      ],
    );
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
