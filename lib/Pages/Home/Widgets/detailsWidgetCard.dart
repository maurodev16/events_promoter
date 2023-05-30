import 'package:events_app/Models/EventsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../DetailsCardPage.dart';

Widget detailWidget() {
  final EventModel events = Get.arguments;

  return Container(
    height: Get.width,
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${events.title.toString()}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
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
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: Text(
              '${events.street.toString()}',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[500],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: Text(
              '${DateFormat('dd.MM.yyyy').format(events.startDate! as DateTime)} as ${events.startTime!}', // format the date using the intl package
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[500],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
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
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://source.unsplash.com/random'),
                    ),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Criado por',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          '${events.organizedBy}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          label: Text("0"),
                          onPressed: () {
                            Get.to(() => DetailsCardPage(), arguments: events);
                          },
                          icon: Icon(IconlyBold.user_3),
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
}
