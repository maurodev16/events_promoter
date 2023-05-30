import 'package:events_app/Pages/Container/ContainerPage.dart';
import 'package:events_app/Pages/CreateParty/CreatePartyPage.dart';
import 'package:events_app/Pages/Home/EventsPage.dart';
import 'package:events_app/Pages/LanguagePage.dart';
import 'package:events_app/Pages/RegisterPage.dart';
import 'package:events_app/Pages/SplashPage.dart';
import 'package:get/get.dart';

import '../Pages/LoginPage.dart';
import '../Pages/ThemePage.dart';

class AppRoutes {
  static const SPLASH = '/splash_page';
  static const CONTAINER = '/container';
  static const LOGIN = '/login_page';
  static const REGISTER = '/register_page';
  static const PARTYPAGE = '/party_page';
  static const CREATEPARTY = '/create_party';
  static const GENERALEVENTSPAGE = '/general_events_page';
  static const LANGUAGEPAGE = '/language_page';
  static const THEMEPAGE = '/theme_page';

  static final pages = [
    GetPage(name: SPLASH, page: () => SplashPage()),
    GetPage(name: CONTAINER, page: () => ContainerPage()),
    GetPage(name: LOGIN, page: () => LoginPage()),
    GetPage(name: REGISTER, page: () => RegisterPage()),
    GetPage(name: PARTYPAGE, page: () => EventsPage()),
    GetPage(name: CREATEPARTY, page: () => CreatePartyPage()),
    GetPage(name: LANGUAGEPAGE, page: () => LanguagePage()),
    GetPage(name: THEMEPAGE, page: () => ThemePage()),
  ];
}
