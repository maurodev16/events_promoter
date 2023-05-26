import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContainerController extends GetxController {
  late PageController pageController;

  final RxInt currentPage = 0.obs;
  void changeTabIndex(int index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
