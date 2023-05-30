import 'package:events_app/Controllers/LoginController.dart';
import 'package:events_app/Controllers/ProfileController.dart';
import 'package:events_app/Models/EventsModel.dart';
import 'package:events_app/Utils/Const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import 'Home/DetailsCardPage.dart';

class ProfilePage extends StatelessWidget {
  final LoginController logincontroller = Get.find();
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: preto_forte,
          body: controller.status.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.status.isEmpty
                  ? Center(
                      child: Text('Your didnt cretated any Party till now!'))
                  : logincontroller.isLoggIn.value == false
                      ? Center(
                          child: Text(
                              'You have to be loggedIn to better enjoy the app!'))
                      : controller.status.isError
                          ? Center(child: Text(controller.status.errorMessage!))
                          : controller.status.isSuccess
                              ? Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                    itemCount:
                                        controller.eventsByPromoter.length,
                                    itemBuilder: (context, index) {
                                      EventModel event =
                                          controller.eventsByPromoter[index];
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
                                                    icon: Icon(IconlyBold
                                                        .editSquare), //state.isLiked.value
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
                                                  IconButton(
                                                    icon:
                                                        Icon(IconlyBold.delete),
                                                    onPressed: () {},
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Text(
                                                  '${event.title.toString()}',
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
                                                      '${event.cityName.toString()}',
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
                                                        color:
                                                            Colors.blueAccent,
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
                                                  '${event.organizedBy.toString()}',
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
                                                  '${DateFormat('dd.MM.yyyy').format(event.startDate as DateTime)} as ${event.startTime!}', // format the date using the intl package
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
                                                  'Info: ${event.description}',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey[500],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
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
                                                              'Criado por voce',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                color: Colors
                                                                    .grey[600],
                                                              ),
                                                            ),
                                                            Text(
                                                              '${DateFormat('dd.MM.yy').format(event.created!)}', // format the date using the intl package
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .grey[500],
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
                                                                  "${event.likesCount.toString()}"),
                                                              onPressed: () {
                                                                Get.to(
                                                                    () =>
                                                                        DetailsCardPage(),
                                                                    arguments:
                                                                        event);
                                                              },
                                                              icon: Icon(
                                                                  IconlyBold
                                                                      .user_3),
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
                                )
                              : Center(
                                  child:
                                      Text("controller.status.errorMessage!"),
                                ),
        );
      },
    );
  }
}
