import 'package:events_app/Controllers/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../Controllers/EventController.dart';
import '../../Utils/Const.dart';
import 'Widgets/CustomSearchInputField.dart';

class CreatePartyPage extends GetView<EventController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EventController eventController = Get.find();
  final LoginController loginController = Get.find();

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
                    "On this screen you can create an event and enjoy with your favorite friends.",
                    style: TextStyle(
                      color: preto_fraco,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // TextField(
                      //   onChanged: (userName) {
                      //     // partyController.searchUsers(userName);
                      //     print("USER NAME ***$userName");
                      //   },
                      //   decoration: InputDecoration(hintText: 'Search by Name'),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                customSearchField(),
                customUserList(),
                SizedBox(height: Get.height * 0.04),
                TextFormField(
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

                ///
                SizedBox(height: 8),

                ///
                TextFormField(
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
                  onChanged: (value) => eventController.placeName.value = value,
                ),

                ///
                SizedBox(height: 8),

                ///
                TextFormField(
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

                ///
                SizedBox(height: 8),

                ///
                TextFormField(
                    maxLength: 50,
                    style: TextStyle(
                      color: preto_fraco,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    //    enabled: !controllerRegister.isLoading.value,
                    keyboardType: TextInputType.number,
                    controller: eventController.dateController,
                    readOnly: true,
                    onTap: () => eventController.selecteDate(context),
                    decoration: InputDecoration(
                      //    errorText: controllerRegister.errorEmail,
                      labelText: 'What date will the party be?',
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
                      eventController.dateController.text = value;
                    }),

                ///
                SizedBox(height: 8),

                ///
                TextFormField(
                  style: TextStyle(
                    color: preto_fraco,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  keyboardType: TextInputType.number,
                  controller: eventController.hourInputController,
                  decoration: InputDecoration(
                    labelText: 'What is the Time of party?',
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
                  // validator: (value) {
                  //   //                  final hourRegExp = RegExp(r'^([0-1][0-9]|[2][0-3]):([0-5][0-9])$');
                  //   // if (!hourRegExp.hasMatch(value ?? '')) {
                  //   //   return 'Please enter a valid time (hh:mm)';
                  //   // }
                  //   // return null;
                  //   if (value == null || !controller.validateHour(value)) {
                  //     return 'Please enter a valid hour (HH:mm ex. 13:00)';
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),

                ///
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
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

                SizedBox(height: Get.height * 0.05),

                ///
                // Obx(
                //   () =>
                ElevatedButton(
                    onPressed: () async {
                      await eventController.createParty();

                      Get.snackbar("Seja bem vinda(o)",
                          "Your Party has been successfully registered!",
                          icon: Icon(IconlyBold.add_user),
                          colorText: branco,
                          backgroundColor: preto_forte);
                      Get.toNamed('/container');
                    },
                    //: null,
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
                    )),
                //),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
