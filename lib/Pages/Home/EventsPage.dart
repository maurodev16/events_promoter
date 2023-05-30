import 'package:events_app/Controllers/EventController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../../Models/EventsModel.dart';
import '../../Utils/Const.dart';

class EventsPage extends GetView<EventController> {
  final EventController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: preto_forte,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAllEventsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllEventsSection() {
    return GetBuilder<EventController>(
      builder: (controller) {
        if (controller.status.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.status.isEmpty) {
          return Center(
            child: Text('Your Party will be displayed here'),
          );
        } else if (controller.status.isError) {
          return Center(
            child: Text(controller.status.errorMessage!),
          );
        } else if (controller.status.isSuccess) {
          return RefreshIndicator(
            onRefresh: controller.loadData,
            backgroundColor: preto_forte,
            color: branco,
            displacement: 25,
            edgeOffset: 2,
            child: Container(
              height: Get.height,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.allEvents.length,
                      itemBuilder: (context, index) {
                        EventModel event = controller.allEvents[index];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: 140,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    image: DecorationImage(
                                      image: NetworkImage(event.bannerUrl!),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          event.title!,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: cinza_w500,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_city,
                                              color: cinza_w500,
                                              size: 11,
                                            ),
                                            Text(
                                              event.cityName!,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: cinza_w500,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        // Row(
                                        //   children: [
                                        //     Icon(
                                        //       IconlyLight.location,
                                        //       color: cinza_w500,
                                        //       size: 10,
                                        //     ),
                                        //     Text(
                                        //       "${event.street!}, ",
                                        //       style: TextStyle(
                                        //         fontSize: 12,
                                        //         color: cinza_w500,
                                        //         fontWeight: FontWeight.bold,
                                        //       ),
                                        //     ),
                                        //     Text(
                                        //       event.number!,
                                        //       style: TextStyle(
                                        //         fontSize: 10,
                                        //         color: cinza_w500,
                                        //         fontWeight: FontWeight.bold,
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        SizedBox(height: 8),
                                        Text(
                                          event.placeName!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: preto_forte,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Icon(
                                                  IconlyLight.calendar,
                                                  color: cinza_w500,
                                                  size: 10,
                                                ),
                                                Text(
                                                  'DATUM',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: vermelho,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${DateFormat('dd.MM.yy').format(event.startDate as DateTime)}',
                                                  style: TextStyle(
                                                    color: cinza_w500,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  '${DateFormat('dd.MM.yy').format(event.endDate as DateTime)}',
                                                  style: TextStyle(
                                                    color: cinza_w500,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              children: [
                                                Icon(
                                                  IconlyLight.time_circle,
                                                  color: cinza_w500,
                                                  size: 12,
                                                ),
                                                Text(
                                                  'TIME',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: vermelho,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${DateFormat('dd.MM.yy').format(event.startTime! as DateTime)}',
                                                  style: TextStyle(
                                                    color: cinza_w500,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  '${DateFormat('dd.MM.yy').format(event.endTime as DateTime)}',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: cinza_w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       top: 8.0, right: 20),
                                //   child: Row(
                                //     children: [
                                //       CircleAvatar(
                                //         radius: 15,
                                //         backgroundColor: preto_fraco,
                                //         child: Icon(
                                //           IconlyBold.notification,
                                //           color: branco,
                                //           size: 15,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text(controller.status.errorMessage!),
          );
        }
      },
    );
  }
}
