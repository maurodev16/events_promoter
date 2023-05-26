import 'package:events_app/Controllers/RegisterController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final RegisterController userController = Get.find();
Widget customSearchField() {
  return TextField(
    controller: userController.searchController,
    // onChanged: (name) => userController.searchUsers(),
    decoration: InputDecoration(
      hintText: "Search user by name",
      prefixIcon: Icon(
        Icons.search,
      ),
    ),
  );
}

Widget customUserList() {
  return Obx(() {
    if (userController.promotersList.isEmpty) {
      return Center(
        child: Text('No user Found!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          final user = userController.promotersList[index];
          return Wrap(
            spacing: 8.0,
            children: [
              Chip(
                label: Text(user.name!),
                avatar: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatarUrl ??
                      "https://firebasestorage.googleapis.com/v0/b/evento-app-5a449.appspot.com/o/logo_app.png?alt=media&token=a160ad6a-f162-4ecc-9e9e-72d83fd56f2b"),
                ),
                onDeleted: () {
                  userController.promotersList.remove(user);
                },
              )
            ],
          );
        },
      );
    }
  });
}
//"https://firebasestorage.googleapis.com/v0/b/evento-app-5a449.appspot.com/o/logo_app.png?alt=media&token=a160ad6a-f162-4ecc-9e9e-72d83fd56f2b"