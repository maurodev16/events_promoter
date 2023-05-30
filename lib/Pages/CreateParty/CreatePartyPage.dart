import 'package:events_app/Controllers/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../Controllers/CityController.dart';
import '../../Controllers/EventController.dart';
import '../../Utils/Const.dart';
import '../../Utils/Widgets/customDropdownCities.dart';

class CreatePartyPage extends GetView<EventController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EventController eventController = Get.find();
  final LoginController loginController = Get.find();
  final CityController controllerCity = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 19, left: 8, right: 8),
                  child: Text(
                    "Select the a imagem to be showing for your guests",
                    style: TextStyle(
                      color: preto_fraco,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),

                Obx(
                  () => GestureDetector(
                    onTap: controller.pickImage,
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: controller.pickedImageUrl.value != null
                          ? Image.file(
                              controller.pickedImageUrl.value!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )
                          : Icon(Icons.image_search, size: 30),
                    ),
                  ),
                ),

                SizedBox(height: Get.height * 0.04),
                Obx(
                  () => TextFormField(
                    readOnly: eventController.isLoading.value,
                    maxLength: 50,
                    style: TextStyle(
                      color: preto_fraco,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    //  enabled: !controllerRegister.isLoading.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      // errorText: partyController.errorFirstname,
                      labelText: 'What is the title of the party?',
                      labelStyle: TextStyle(
                        color: cinza_w500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onChanged: (value) => eventController.title.value = value,
                  ),
                ),

                ///
                SizedBox(height: 8),

                ///
                Obx(
                  () => TextFormField(
                    readOnly: eventController.isLoading.value,
                    maxLength: 80,
                    style: TextStyle(
                      color: preto_fraco,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    // enabled: !controllerRegister.isLoading.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      //  errorText: controllerRegister.errorLastname,
                      labelText: 'Place where the party will be',
                      hintText: 'ex.. Irish Pub',
                      hintStyle: TextStyle(
                        color: cinza_w500,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      labelStyle: TextStyle(
                        color: cinza_w500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onChanged: (value) =>
                        eventController.placeName.value = value,
                  ),
                ),

                ///
                SizedBox(height: 8),

                ///
                Obx(
                  () => TextFormField(
                    readOnly: eventController.isLoading.value,
                    maxLength: 50,
                    style: TextStyle(
                      color: preto_fraco,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    //    enabled: !controllerRegister.isLoading.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      //    errorText: controllerRegister.errorEmail,
                      labelText: 'What is the address of the party?',
                      hintText: 'ex.. Musterstr, 1',
                      hintStyle: TextStyle(
                        color: cinza_w500,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      labelStyle: TextStyle(
                        color: cinza_w500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onChanged: (value) => eventController.street.value = value,
                  ),
                ),

                ///
                SizedBox(height: 8),

                ///
                Obx(
                  () => TextFormField(
                      enabled: !eventController.isLoading.value,
                      maxLength: 50,
                      style: TextStyle(
                        color: preto_fraco,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      //    enabled: !controllerRegister.isLoading.value,
                      keyboardType: TextInputType.number,
                      controller: eventController.txtStartDateController,
                      readOnly: true,
                      onTap: () => eventController.selecteDate(context),
                      decoration: InputDecoration(
                        //    errorText: controllerRegister.errorEmail,
                        labelText: 'Start Date will the party be?',
                        hintText: 'Selecione uma data',
                        hintStyle: TextStyle(
                          color: cinza_w500,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        labelStyle: TextStyle(
                          color: cinza_w500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onChanged: (value) {
                        eventController.txtStartDateController.text = value;
                      }),
                ),
                Obx(
                  () => TextFormField(
                      enabled: !eventController.isLoading.value,
                      maxLength: 50,
                      style: TextStyle(
                        color: preto_fraco,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      //    enabled: !controllerRegister.isLoading.value,
                      keyboardType: TextInputType.number,
                      controller: eventController.txtEndDateController,
                      readOnly: true,
                      onTap: () => eventController.selecteDate(context),
                      decoration: InputDecoration(
                        //    errorText: controllerRegister.errorEmail,
                        labelText: 'End Date will the party be?',
                        hintText: 'Selecione uma data',
                        hintStyle: TextStyle(
                          color: cinza_w500,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        labelStyle: TextStyle(
                          color: cinza_w500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onChanged: (value) {
                        eventController.txtEndDateController.text = value;
                      }),
                ),

                ///
                SizedBox(height: 8),

                ///
                Obx(
                  () => TextFormField(
                    readOnly: eventController.isLoading.value,
                    style: TextStyle(
                      color: preto_fraco,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    keyboardType: TextInputType.number,
                    controller: eventController.hourInputController,
                    decoration: InputDecoration(
                      labelText: 'Start Time of party?',
                      labelStyle: TextStyle(
                        color: cinza_w500,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'ex: 13:00',
                      hintStyle: TextStyle(
                        color: cinza_w500,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    onChanged: (input) {
                      eventController.hourInputController.value =
                          input as TextEditingValue;
                    },
                  ),
                ),
                Obx(
                  () => TextFormField(
                    readOnly: eventController.isLoading.value,
                    style: TextStyle(
                      color: preto_fraco,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    keyboardType: TextInputType.number,
                    controller: eventController.hourInputController,
                    decoration: InputDecoration(
                      labelText: 'End Time of party?',
                      labelStyle: TextStyle(
                        color: cinza_w500,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'ex: 13:00',
                      hintStyle: TextStyle(
                        color: cinza_w500,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    onChanged: (input) {
                      eventController.hourInputController.value =
                          input as TextEditingValue;
                    },
                  ),
                ),

                // Dropdown do cityName
                Obx(
                  () => TextFormField(
                    enabled: !eventController.isLoading.value,
                    readOnly: true,
                    controller: eventController.textEditCityController,
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate:
                            CitySearchDelegate(cities: controllerCity.cities),
                      ).then((selectedCity) {
                        if (selectedCity != null) {
                          // Atualizar o valor selecionado no TextFormField
                          eventController.textEditCityController.text =
                              selectedCity;
                        }
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Search City',
                      labelStyle: TextStyle(
                        color: cinza_w500,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      suffixIcon: Icon(IconlyBold.arrow_down_circle),
                    ),
                    onChanged: (value) {
                      controllerCity.searchCity(value);
                    },
                  ),
                ),

                ///
                SizedBox(height: 20),
                Obx(
                  () => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      readOnly: eventController.isLoading.value,
                      maxLength: 200,
                      style: TextStyle(
                        color: preto_fraco,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Type some information about the party',
                        labelStyle: TextStyle(
                          color: cinza_w500,
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: 'ex.. Mandatory attire',
                        hintStyle: TextStyle(
                          color: cinza_w500,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        contentPadding: EdgeInsets.all(16),
                      ),
                      onChanged: (value) {
                        eventController.description.value = value;
                      },
                    ),
                  ),
                ),

                SizedBox(height: Get.height * 0.05),

                ///
                Obx(
                  () => ElevatedButton(
                    onPressed: !eventController.isLoading.value
                        ? () async {
                            await eventController.createParty();

                            Get.snackbar("Seja bem vinda(o)",
                                "Your Party has been successfully registered!",
                                icon: Icon(IconlyBold.add_user),
                                colorText: branco,
                                backgroundColor: preto_forte);
                            Get.toNamed('/container');
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      animationDuration: Duration(seconds: 55),
                      backgroundColor: preto_medio,
                    ),
                    child: Text(
                      'Let`s do it!',
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
