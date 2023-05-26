import 'package:events_app/Controllers/LoginController.dart';
import 'package:events_app/Pages/RegisterPage.dart';
import 'package:events_app/Utils/Const.dart';
import 'package:events_app/Utils/Widgets/WidgetAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/RegisterController.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.find();
  final RegisterController controllerRegister = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Login"),
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Obx(
                        () => TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            errorText: controller.errorEmail,
                            labelText: 'Email',
                            hintText: 'Email',
                            labelStyle: TextStyle(
                              color: preto_forte,
                              fontFamily: "HelveticaNeue",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onChanged: (value) =>
                              controller.rxEmail.value = value,
                        ),
                      ),

                      ///
                      SizedBox(height: 16),
                      Obx(
                        () => TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            errorText: controller.errorPassword,
                            labelStyle: TextStyle(
                              color: preto_forte,
                              fontFamily: "HelveticaNeue",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onChanged: (value) =>
                              controller.rxPassword.value = value,
                        ),
                      ),

                      SizedBox(height: 16),
                      Obx(
                        () => ElevatedButton(
                          onPressed: controller.loginButtonEnabled!
                              ? () {
                                  controller.login();

                                  Get.back();
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            animationDuration: Duration(seconds: 55),
                            backgroundColor: preto_medio,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: branco,
                              fontFamily: "HelveticaNeue",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Dont have an account?"),
                              TextButton.icon(
                                  onPressed: () {
                                    Get.to(() => RegisterPage());
                                  },
                                  icon: Icon(Icons.app_registration),
                                  label: Text("Create now!"))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
