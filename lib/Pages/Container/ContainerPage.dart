import 'package:events_app/Pages/CreateParty/CreatePartyPage.dart';
import 'package:events_app/Pages/ProfilePage.dart';
import 'package:events_app/Utils/Const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconly/iconly.dart';
import '../../Controllers/ContainerController.dart';
import '../../Utils/Widgets/WidgetAppBar.dart';
import 'Widgets/WidgetButtonAppItem.dart';
import '../Home/EventsPage.dart';

class ContainerPage extends GetView<ContainerController> {
  final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: appBar,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            EventsPage(),
            CreatePartyPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          notchMargin: 10,
          child: Container(
            // color: preto_forte,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customBottomAppBarItem(
                  context,
                  page: 0,
                  title: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: controller.currentPage.value == 0
                          ? preto_forte
                          : cinza_w500,
                    ),
                  ),
                  icon: Icon(
                    IconlyLight.home,
                    color: controller.currentPage.value == 0
                        ? preto_forte
                        : cinza_w500,
                    size: 20,
                  ),
                  color: controller.currentPage.value == 0
                      ? preto_forte
                      : cinza_w500,
                ),
                customBottomAppBarItem(
                  context,
                  page: 1,
                  title: Text(
                    "",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: controller.currentPage.value == 1
                          ? preto_forte
                          : cinza_w500,
                    ),
                  ),
                  icon: Icon(
                    IconlyLight.plus,
                    color: controller.currentPage.value == 1
                        ? preto_forte
                        : cinza_w500,
                    size: 20,
                  ),
                  color: controller.currentPage.value == 1
                      ? preto_forte
                      : cinza_w500,
                ),
                customBottomAppBarItem(
                  context,
                  page: 2,
                  title: Text(
                    "",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: controller.currentPage.value == 2
                          ? preto_forte
                          : cinza_w500,
                    ),
                  ),
                  icon: Icon(
                    IconlyLight.profile,
                    color: controller.currentPage.value == 2
                        ? preto_forte
                        : cinza_w500,
                    size: 20,
                  ),
                  color: controller.currentPage.value == 2
                      ? preto_forte
                      : cinza_w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
