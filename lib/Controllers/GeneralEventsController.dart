import 'package:events_app/Models/EventsModel.dart';
import 'package:get/get.dart';

import '../Repositories/IRepositoryGeneralEvents.dart';

class GeneralEventsController extends GetxController with StateMixin {
  final IRepositoryGeneralEvents _repositoryEvents;
  GeneralEventsController(this._repositoryEvents);
  var allEventsList = <EventModel>[].obs;
  var isLoading = false.obs;
  @override
  void onReady() {
    events();
    super.onReady();
  }

  Future<void> events() async {
    change([], status: RxStatus.loading());
    try {
      final response = await _repositoryEvents.getAllEvents();
      update();
      if (response.isEmpty) {
        change([],
            status: RxStatus.error('All Events will be displayed here!'));
        allEventsList.clear();
        allEventsList.value = [];
        return;
      } else {
        List<EventModel> eventsList = [];
        for (var event in response) {
          // ignore: unnecessary_null_comparison
          if (event != null) {
            eventsList.addAll(response);
          }
        }
        if (eventsList.isEmpty) {
          change([],
              status: RxStatus.error('All Events will be displayed here!'));
          allEventsList.clear();
          allEventsList.value = [];
          return;
        } else {
          change(eventsList, status: RxStatus.success());
          allEventsList.addAll(eventsList);
        }
      }
    } catch (e) {
      print("Error loading Events: $e");
      change([], status: RxStatus.error('Error loading events'));
      allEventsList.clear();
      allEventsList.value = [];
    }
  }

  Future<void> loadData() async {
    isLoading.value = true;
    events();
    isLoading.value = false;
    update();
    print(isLoading.value);
  }
}
