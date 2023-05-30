import 'package:events_app/Controllers/AvatarController.dart';
import 'package:events_app/Controllers/CityController.dart';
import 'package:events_app/Controllers/EventController.dart';
import 'package:events_app/Controllers/GeneralEventsController.dart';
import 'package:events_app/Controllers/ProfileController.dart';
import 'package:events_app/Controllers/RegisterPromoterController.dart';
import 'package:events_app/Controllers/SettingsController.dart';
import 'package:events_app/Repositories/IRepositoryAvatar.dart';
import 'package:events_app/Repositories/IRepositoryCity.dart';
import 'package:events_app/Repositories/IRepositoryGeneralEvents.dart';
import 'package:events_app/Repositories/IRepositoryLogin.dart';
import 'package:events_app/Repositories/IRepositoryProfile.dart';
import 'package:events_app/Repositories/IRepositoryPromoter.dart';
import 'package:events_app/Repositories/RepositoryAvatar.dart';
import 'package:events_app/Repositories/RepositoryCity.dart';
import 'package:events_app/Repositories/RepositoryGeneralEvents.dart';
import 'package:events_app/Repositories/RepositoryLogin.dart';
import 'package:events_app/Repositories/RepositoryProfile.dart';
import 'package:events_app/Repositories/RepositoryPromoter.dart';
import 'package:get/get.dart';
import '../Controllers/ContainerController.dart';
import '../Controllers/SplashController.dart';
import '../Controllers/LoginController.dart';
import '../Repositories/IRepositoryEvent.dart';
import '../Repositories/IRepositorySettings.dart';
import '../Repositories/RepositoryEvent.dart';
import '../Repositories/RepositorySettings.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(Get.find()));
    Get.lazyPut<AvatarController>(() => AvatarController());
    Get.lazyPut<SplashController>(() => SplashController());
    Get.put(ContainerController());
    Get.lazyPut<RegisterController>(() => RegisterController(Get.find()));
    Get.lazyPut<SettingsController>(() => SettingsController(Get.find()));
    Get.lazyPut<CityController>(() => CityController(Get.find()));
    Get.lazyPut<EventController>(() => EventController(Get.find()));
    Get.lazyPut<ProfileController>(() => ProfileController(Get.find()));
    Get.lazyPut<GeneralEventsController>(
        () => GeneralEventsController(Get.find()));

    // Get.put<IRepositorySettings>(RepositorySettings());
    Get.put<IRepositoryLogin>(RepositoryLogin());
    Get.put<IRepositoryAvatar>(RepositoryAvatar());
    Get.put<IRepositoryParty>(RepositoryParty());
    Get.put<IRepositoryPromoter>(RepositoryPromoter());
    Get.put<IRepositoryCity>(RepositoryCity());
    Get.put<IRepositoryProfile>(RepositoryProfile());
    Get.put<IRepositoryGeneralEvents>(RepositoryGeneralEvents());
    Get.put<IRepositorySettings>(RepositorySettings());
  }
}
