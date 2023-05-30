import 'package:events_app/Controllers/CityController.dart';
import 'package:events_app/Controllers/RegisterPromoterController.dart';
import 'package:events_app/Pages/Container/ContainerPage.dart';
import 'package:events_app/Utils/Const.dart';
import 'package:events_app/Utils/Widgets/customDropdownCities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class RegisterPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegisterController controllerRegister = Get.find();
  final CityController controllerCity = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: Get.height * 0.05),
                Obx(
                  () => TextFormField(
                    enabled: !controllerRegister.isLoading.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorText: controllerRegister.errorName,
                      labelText: 'Full name',
                      labelStyle: TextStyle(
                        color: preto_forte,
                        fontFamily: "HelveticaNeue",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) => controllerRegister.name.value = value,
                  ),
                ),

                ///
                SizedBox(height: 8),

                //
                Obx(
                  () => TextFormField(
                    enabled: !controllerRegister.isLoading.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorText: controllerRegister.errorCompany,
                      labelText: 'Company Name',
                      labelStyle: TextStyle(
                        color: preto_forte,
                        fontFamily: "HelveticaNeue",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) =>
                        controllerRegister.company.value = value,
                  ),
                ),

                ///
                SizedBox(height: 8),

                ///
                Obx(
                  () => TextFormField(
                    enabled: !controllerRegister.isLoading.value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorText: controllerRegister.errorEmail,
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: preto_forte,
                        fontFamily: "HelveticaNeue",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) =>
                        controllerRegister.email.value = value,
                  ),
                ),

                ///
                SizedBox(height: 8),
                //
                TextFormField(
                  readOnly: true,
                  controller: controllerRegister.textEditingController,
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate:
                          CitySearchDelegate(cities: controllerCity.cities),
                    ).then((selectedCity) {
                      if (selectedCity != null) {
                        // Atualizar o valor selecionado no TextFormField
                        controllerRegister.textEditingController.text =
                            selectedCity;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Search City',
                    labelStyle: TextStyle(
                      color: preto_forte,
                      fontFamily: "HelveticaNeue",
                      fontWeight: FontWeight.bold,
                    ),
                    suffixIcon: Icon(IconlyBold.arrow_down_circle),
                  ),
                  onChanged: (value) {
                    controllerCity.searchCity(value);
                  },
                ),

                ///
                SizedBox(height: 8),

                ///
                Obx(
                  () => TextFormField(
                    enabled: !controllerRegister.isLoading.value,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: controllerRegister.errorPassword,
                      labelStyle: TextStyle(
                        color: preto_forte,
                        fontFamily: "HelveticaNeue",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) =>
                        controllerRegister.password.value = value,
                  ),
                ),

                ///
                SizedBox(height: 8),

                ///
                Obx(
                  () => TextFormField(
                    enabled: !controllerRegister.isLoading.value,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      errorText: controllerRegister.errorCofirmPassword,
                      labelStyle: TextStyle(
                        color: preto_forte,
                        fontFamily: "HelveticaNeue",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) =>
                        controllerRegister.confirmPassword.value = value,
                  ),
                ),

                ///
                SizedBox(height: Get.height * 0.05),

                ///
                Obx(
                  () => ElevatedButton(
                    onPressed: controllerRegister.loginButtonEnabled!
                        ? () async {
                            await controllerRegister.createPromoter();
                            if (controllerRegister.errorMessage.value == "") {
                              Get.snackbar("Seja bem vinda(o)",
                                  "Voce efetuou seu cadastro com sucesso!",
                                  icon: Icon(IconlyBold.add_user),
                                  colorText: branco,
                                  backgroundColor: preto_forte);
                              Get.offAll(() => ContainerPage());
                            } else {
                              Get.snackbar(
                                  "Upss!!!", "Ouve um erro ao registrar",
                                  icon: Icon(IconlyBold.info_square),
                                  colorText: branco,
                                  backgroundColor: preto_forte);
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      animationDuration: Duration(seconds: 55),
                      backgroundColor: preto_medio,
                    ),
                    child: !controllerRegister.isLoading.value
                        ? Text(
                            'Create Account',
                            style: TextStyle(
                              color: branco,
                              fontFamily: "HelveticaNeue",
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            'Aguarde...',
                            style: TextStyle(
                              color: branco,
                              fontFamily: "HelveticaNeue",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
