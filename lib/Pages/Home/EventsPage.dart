import 'package:events_app/Controllers/EventController.dart';
import 'package:events_app/Controllers/LoginController.dart';
import 'package:events_app/Utils/Const.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../../Models/EventsModel.dart';
import 'DetailsCardPage.dart';

class EventsPage extends StatelessWidget {
  final EventController eventController = Get.find();
  final LoginController logincontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
      builder: (controller) => Scaffold(
        backgroundColor: preto_forte,
        body: controller.status.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.status.isEmpty
                ? Center(child: Text('All Party will be displayed here'))
                : controller.status.isError
                    ? Center(
                        child: Text(controller.status.errorMessage.toString()),
                      )
                    : controller.status.isSuccess
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RefreshIndicator(
                              onRefresh: controller.loadData,
                              backgroundColor: preto_forte,
                              color: branco,
                              displacement: 25,
                              edgeOffset: 2,
                              child: Expanded(
                                child: ListView.builder(
                                  itemCount: controller.allEvents.length,
                                  itemBuilder: (context, index) {
                                    EventModel events =
                                        controller.allEvents[index];
                                    return Container(
                                      height: Get.width,
                                      child: Card(
                                        key: Key('$index'),
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons
                                                      .favorite_border), //state.isLiked.value
                                                  // ? Icons.favorite
                                                  // : Icons.favorite_border),
                                                  onPressed: () {
                                                    // state.isLiked.value = !state.isLiked.value;
                                                    // if (state.isLiked.value) {
                                                    //   state.likeCount++;
                                                    //   state.likedBy
                                                    //       .add('User ${state.likedBy.length + 1}');
                                                    // } else {
                                                    //   state.likeCount--;
                                                    //   state.likedBy.removeLast();
                                                    // }
                                                  },
                                                ),
                                                // ignore: unnecessarystatenullstatecomparison
                                                // state.likeCount != null
                                                //     ? Text(
                                                //         '${state.likeCount.value}',
                                                //         style: TextStyle(
                                                //           fontSize: 14,
                                                //           color: Colors.grey[600],
                                                //         ),
                                                //       )
                                                //     : Container(),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                '${events.title.toString()}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0,
                                                  right: 16.0,
                                                  bottom: 8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '${events.placeName.toString()}',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      IconlyLight.location,
                                                      size: 18,
                                                      color: cinza_w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0,
                                                  right: 16.0,
                                                  bottom: 8.0),
                                              child: Text(
                                                '${events.street.toString()}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0,
                                                  right: 16.0,
                                                  bottom: 8.0),
                                              child: Text(
                                                '${DateFormat('dd.MM.yy').format(events.startDate!)} as ${events.startTime!}', // format the date using the intl package
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0,
                                                  right: 16.0,
                                                  bottom: 8.0),
                                              child: Text(
                                                'Info: ${events.description}',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                'https://source.unsplash.com/random'),
                                                      ),
                                                      SizedBox(width: 8.0),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            'Criado por',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              color: Colors
                                                                  .grey[600],
                                                            ),
                                                          ),
                                                          Text(
                                                            '${events.organizedBy}',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child:
                                                              TextButton.icon(
                                                            label: Text(
                                                              "confirmController.confirmedParticipantsCount.value",
                                                              style: TextStyle(
                                                                color:
                                                                    cinza_w500,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Get.to(
                                                                () =>
                                                                    DetailsCardPage(),
                                                                arguments:
                                                                    events,
                                                              );
                                                            },
                                                            icon: Icon(
                                                              IconlyBold.user_3,
                                                              color: cinza_w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                            ),
                          )
                        : Center(
                            child:
                                Text('All Your Events will be displayed here'),
                          ),
      ),
    );
  }
}
