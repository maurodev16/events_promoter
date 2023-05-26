import 'package:events_app/Utils/Const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/SplashController.dart';

class SplashPage extends GetView<SplashController> {
  final SplashController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: preto_forte,
      body: Center(
        child: Image.asset(
          'assets/images/logo_app.png',
          width: 200,
          height: 100,
        ),
      ),
    );
  }
}
