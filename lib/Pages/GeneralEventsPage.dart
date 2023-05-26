import 'package:events_app/Controllers/GeneralEventsController.dart';
import 'package:events_app/Models/EventsModel.dart';
import 'package:events_app/Utils/Const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class GeneralEventsPage extends GetView<GeneralEventsController> {
  final GeneralEventsController generalEventsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralEventsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: preto_forte,
          body: controller.status.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.status.isEmpty
                  ? Center(child: Text('All Events will be displayed here'))
                  : controller.status.isError
                      ? Center(child: Text(controller.status.errorMessage!))
                      : controller.status.isSuccess
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RefreshIndicator(
                                onRefresh: controller.loadData,
                                backgroundColor: preto_forte,
                                color: branco,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount:
                                            controller.allEventsList.length,
                                        itemBuilder: (context, index) {
                                          EventModel events =
                                              controller.allEventsList[index];

                                          String? name;
                                          String? addresse;

                                          DateTime dataTimeStart =
                                              DateTime.parse(
                                                  events.startDate as String);
                                          String startDate =
                                              "Datum: ${dataTimeStart.day.toString().padLeft(2, '0')}.${dataTimeStart.month.toString().padLeft(2, '0')}.${dataTimeStart.year}";
                                          String startsTime =
                                              "ab ${dataTimeStart.hour.toString().padLeft(2, '0')}:${dataTimeStart.minute.toString().padLeft(2, '0')} Uhr";

                                          return Card(
                                            key: Key('$index'),
                                            elevation: 4,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Container(
                                              height: 330,
                                              width: double.infinity,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      '${events.title}',
                                                      style: TextStyle(
                                                        color: preto_forte,
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${name ?? ""}',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.lightBlue,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 16.0,
                                                      bottom: 0.0,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '${addresse ?? ""}',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: cinza_w500,
                                                          ),
                                                        ),
                                                        Icon(
                                                          IconlyLight.location,
                                                          size: 18,
                                                          color: preto_forte,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 16.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .music_note_rounded,
                                                          size: 15,
                                                          color: preto_forte,
                                                        ),
                                                        SizedBox(width: 5),
                                                        Chip(
                                                          labelPadding:
                                                              EdgeInsets.only(
                                                            top: -6,
                                                            bottom: -3,
                                                            right: 2,
                                                            left: 3,
                                                          ),
                                                          label: Text(
                                                            '${events.title}',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color: cinza_w500,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 5),
                                                        Chip(
                                                          labelPadding:
                                                              EdgeInsets.only(
                                                            top: -6,
                                                            bottom: -3,
                                                            right: 2,
                                                            left: 3,
                                                          ),
                                                          label: Text(
                                                            '${events.description}',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color: cinza_w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                      color: cinza_w500,
                                                      thickness: 1),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 16.0),
                                                    child: Text(
                                                      "EVENTS DETAILS",
                                                      style: TextStyle(
                                                        color: cinza_w500,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 2,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Text(
                                                    "DATE & TIME",
                                                    style: TextStyle(
                                                      color: preto_forte,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 2,
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 16.0,
                                                            bottom: 8.0),
                                                    child: Text(
                                                      "$startDate $startsTime",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: cinza_w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    controller.isLoading.value
                                        ? CircularProgressIndicator()
                                        : Container(),
                                  ],
                                ),
                              ),
                            )
                          : Center(
                              child: Text(controller.status.errorMessage!),
                            ),
        );
      },
    );
  }
}
