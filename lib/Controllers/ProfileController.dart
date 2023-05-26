import 'package:events_app/Models/EventsModel.dart';
import 'package:events_app/Models/PromoterModel.dart';
import 'package:events_app/Repositories/IRepositoryProfile.dart';
import 'package:get/get.dart';

import 'LoginController.dart';

class ProfileController extends GetxController with StateMixin {
  ProfileController(this._repositoryProfile);
  final IRepositoryProfile _repositoryProfile;
  final LoginController _loginController = Get.find();
  final RxList<EventModel> eventsByPromoter = RxList<EventModel>([]);
  PromoterModel? promoterModel;
  @override
  void onInit() async {
    // await loadPartiesByUser();
    super.onInit();
  }

  @override
  void onReady() async {
    await loadEventsByPromoter();
    super.onReady();
  }

  Future<void> loadEventsByPromoter() async {
    String? promoterId = _loginController.getCurrentPromoter();
    if (promoterId == null || promoterId.isEmpty) {
      change([], status: RxStatus.error(""));
      eventsByPromoter.clear();
      eventsByPromoter.value = [];
      return null;
    } else
      try {
        change([], status: RxStatus.loading());
        final response =
            await _repositoryProfile.getEventsByPromoterId(promoterId);

        eventsByPromoter.clear();
        if (response.isEmpty) {
          change([],
              status: RxStatus.error('Your Party will be displayed here!'));
          eventsByPromoter.clear();
          eventsByPromoter.value = [];
        } else
          change(response, status: RxStatus.success());
        eventsByPromoter.assignAll(response);
      } catch (e) {
        change([], status: RxStatus.error('Error loading parties'));
        eventsByPromoter.clear();
        eventsByPromoter.value = [];
      }
    update();
  }
}
