import 'dart:io';
import 'package:events_app/Models/PromoterModel.dart';
import 'package:events_app/Pages/Container/ContainerPage.dart';
import 'package:events_app/Repositories/IRepositoryPromoter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/CityModel.dart';
import 'CityController.dart';

class RegisterController extends GetxController {
  final IRepositoryPromoter _repositoryPromoter;
  RegisterController(this._repositoryPromoter);
  final CityController controllerCity = Get.find();
  final TextEditingController textEditingController = TextEditingController();

  final city = ModelCity().obs;
  final promoterModel = PromoterModel().obs;
  var errorMessage = "".obs;
  var isLogged = false.obs;
  var isLoading = false.obs;
  late File image;
  var imageLoading = false.obs;
  var name = ''.obs;
  var company = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  final RxList<PromoterModel> promotersList = RxList([]);
  final TextEditingController searchController = TextEditingController();

  @override
  onInit() async {
    super.onInit();
    ever(isLogged, (callback) => Get.to(ContainerPage()));
    //isLogged.value= await  Preferences.hasToken();
  }

  bool get validateName =>
      name.value.trim().isNotEmpty &&
      name.value.length <= 90 &&
      name.value.length > 1;

  String? get errorName {
    if (validateName)
      return null;
    else if (name.value.isEmpty) {
      return null;
    } else if (name.value.length < 2) {
      return "Name is to short!";
    }
    return "Name is to long!";
  }

  bool get validateCompany => company.value.trim().isNotEmpty;

  String? get errorCompany {
    if (validateCompany)
      return null;
    else if (company.value.isEmpty) {
      return null;
    }
    return "Invalid company name";
  }

  ///

  bool get validateEmail => email.value.isEmail;

  String? get errorEmail {
    if (validateEmail)
      return null;
    else if (email.value.isEmpty) {
      return null;
    }
    return "Email invalido, verifique!";
  }

  bool get validatePassword =>
      password.value.trim().isNotEmpty && password.value.length >= 7;

  String? get errorPassword {
    if (validatePassword)
      return null;
    else if (password.value.isEmpty) {
      return null;
    }
    return "Password invalifo, verifique!";
  }

  bool get validateConfirmPassword => confirmPassword.value == password.value;

  String? get errorCofirmPassword {
    if (validateConfirmPassword)
      return null;
    else if (confirmPassword.value.trim().isEmpty) {
      return null;
    }
    return "Confirme as senhas!";
  }

  bool? get loginButtonEnabled {
    if (validateEmail &&
        validateCompany &&
        validatePassword &&
        validateConfirmPassword &&
        validateName) {
      return true;
    } else {
      return false;
    }
  }

  ///
  Future<void> createPromoter() async {
    isLoading.value = true;
    try {
      // DateTime dateTime =
      //     DateTime.parse(DateTime.now().toLocal().toIso8601String());
      final promoter = PromoterModel(
        avatarUrl: null,
        name: name.value,
        email: email.value,
        company: company.value,
        password: password.value,
        cityName: textEditingController.text,
      );
      await _repositoryPromoter.addPromoter(promoter);
    } catch (e) {
      errorMessage.value = e.toString();
      //throw Exception('MOTIO DO ERRO::::::${e.toString()}');
    } finally {
      // esconder o indicador de progresso
      isLoading.value = false;
    }
  }
}
