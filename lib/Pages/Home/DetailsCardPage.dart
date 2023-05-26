import 'package:events_app/Utils/Const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/detailsWidgetCard.dart';

class DetailsCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: preto_forte),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              detailWidget(),
              SizedBox(height: 20),
              Container(
                height: Get.height * 0.3,
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width * 1,
                      decoration: BoxDecoration(
                        color: preto_forte,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          //  controller.addConfirmedParticipants();
                        },
                        icon: Icon(Icons.confirmation_num, color: Colors.white),
                        label: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width * 1,
                      decoration: BoxDecoration(
                        color: vermelho,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.timer, color: branco),
                        label: Text(
                          'Im not sure',
                          style: TextStyle(color: branco),
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width * 1,
                      decoration: BoxDecoration(
                        color: cinza_w500,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.cancel, color: Colors.white),
                        label: Text(
                          'I dont go',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
