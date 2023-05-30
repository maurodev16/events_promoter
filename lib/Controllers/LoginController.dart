import 'dart:convert';

import 'package:events_app/Models/PromoterModel.dart';
import 'package:events_app/Repositories/IRepositoryLogin.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'ProfileController.dart';

class LoginController extends GetxController {
  final IRepositoryLogin _iRepositoryLogin;
  LoginController(this._iRepositoryLogin);

  // Defina as variáveis para os dados do Pomoter
  var isLoggIn = false.obs;
  var isLoggingOut = false.obs;
  var isLogoutCompleted = false.obs;
  final storage = GetStorage();
  PromoterModel? promoter;

  var rxPromoterId = ''.obs;
  var rxNickname = ''.obs;
  var rxEmail = ''.obs;
  var rxPassword = ''.obs;
  var rxToken = "".obs;

  @override
  void onInit() async {
    super.onInit();

    var id = storage.read<String>('id');
    var email = storage.read<String>('email');
    var token = storage.read<String>('token');
    getCurrentPromoter();
    print("******PROMOTERID READ $id");
    print("******EMAIL READ $email");
    print("******TOKEN READ $token");
    if (token != null && id != null && email != null) {
      this.rxPromoterId.value = id;
      this.rxToken.value = token;
      this.rxEmail.value = email;

      isLoggIn.value = true;
      print("******isLogged.value ${isLoggIn.value}");

      // Crie um novo objeto PromoterModel com os dados recuperados
      promoter = PromoterModel(
        id: id,
        email: email,
        //token: token,
      );

      // Atualize o perfil do usuário com os dados recuperados
      ProfileController profileController = Get.find();
      profileController.promoterModel = promoter;
      profileController.eventsByPromoter.clear();
      profileController.loadEventsByPromoter();
    }
  }

  bool get validateEmail => rxEmail.value.isEmail;

  String? get errorEmail {
    if (validateEmail)
      return null;
    else if (rxEmail.value.isEmpty) {
      return null;
    }
    return "Email invalido, verifique!";
  }

  bool get validatePassword =>
      rxPassword.value.trim().isNotEmpty && rxPassword.value.length >= 7;

  String? get errorPassword {
    if (validatePassword)
      return null;
    else if (rxPassword.value.isEmpty) {
      return null;
    }
    return "Password invalifo, verifique!";
  }

  bool? get loginButtonEnabled {
    if (validateEmail && validatePassword) {
      return true;
    } else {
      return false;
    }
  }

  // Aqui você pode fazer a chamada para a API para verificar se as credenciais do usuário são válidas
  // Se as credenciais estiverem corretas, você pode armazenar as informações do usuário no UserModel
  var promoterModel = PromoterModel().obs;

  Future<void> login() async {
    promoterModel.value = PromoterModel(
      email: rxEmail.value,
      password: rxPassword.value,
    );
    update();
    var response = await _iRepositoryLogin.ilogin(
        promoterModel.value.email!, promoterModel.value.password!);

    // Verifique se tem token
    if (response != null) {
      // Parseie a resposta JSON
      final responseData = json.decode(response);

      // Obtenha os dados individuais
      final id = responseData["id"];
      final email = responseData["email"];
      final token = responseData["token"];

      // Salve os dados no GetStorage
      storage.write('id', id);
      storage.write('email', email);
      storage.write('token', token);

      // Atualize as variáveis do controller
      this.rxPromoterId.value = id;
      this.rxEmail.value = email;
      this.rxToken.value = token;
      print('Enviando dados: $responseData');

      isLoggIn.value = true;
      ProfileController profileController = Get.find();

      profileController.eventsByPromoter.clear();
      profileController.loadEventsByPromoter();
    } else {
      isLoggIn.value = false;
      return null;
    }
  }

  Future<void> logout() async {
    update();
    isLoggingOut.value = true;
    isLogoutCompleted.value = false;
    try {
      await storage.remove('id');
      await storage.remove('token');
      await storage.remove('email');
      if (storage.read<String>('token')!.isEmpty ||
          storage.read<String>('token') == null) {
        rxNickname.value = '';
        rxEmail.value = '';
        rxToken.value = '';
        rxPromoterId.value = '';
        ProfileController profileController = Get.find();
        profileController.eventsByPromoter.clear();
        profileController.eventsByPromoter.value = [];
        print("MEU TOKEN  logout**************** $rxToken");
      }
    } catch (e) {
      print("MEU TOKEN  logout**************** $e");
    } finally {
      isLoggingOut.value = false;
      isLogoutCompleted.value = true;
      update();
    }
  }

  void resetLogoutStatus() {
    isLoggingOut.value = false;
    isLogoutCompleted.value = false;
    update();
  }

  String? getCurrentPromoter() {
    update();

    String? id = storage.read<String>('id');
    if (id != null) {
      return id;
    } else {
      return null;
    }
  }
}
