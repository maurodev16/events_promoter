import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TranslationService extends Translations {
  static final Locale? locale = Locale('en', 'US');
  static final Locale? fallbackLocale = Locale('en', 'US');

  static final storage = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
    String? lang = storage.read('language');
    if (lang != null) {
      locale.val(lang);
      locale.val(lang);
      Get.updateLocale(Locale(lang));
    } else {
      storage.write('language', locale.val);
    }
    Get.updateLocale(Locale(lang!));
  }

  static void changeLocale(String lang) {
    locale.val(lang);
    storage.write('language', lang);
    Get.updateLocale(Locale(lang));
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'signup': 'Sign Up',
          'firstName': 'First Name',
          'lastName': 'Last Name',
          'email': 'Email',
          'city': 'City',
          'password': 'Password',
          'confirmPassword': 'Confirm Password',
          'welcomeMessage': 'Welcome, you have successfully signed up!',
          'errorOccurred': 'Oops!!! An error occurred while signing up.'
        },
        'pt_BR': {
          'signup': 'Cadastrar',
          'firstName': 'Nome',
          'lastName': 'Sobrenome',
          'email': 'E-mail',
          'city': 'Cidade',
          'password': 'Senha',
          'confirmPassword': 'Confirmar Senha',
          'welcomeMessage':
              'Seja bem-vindo(a), você efetuou seu cadastro com sucesso!',
          'errorOccurred': 'Upss!!! Houve um erro ao registrar.'
        }
      };
}
