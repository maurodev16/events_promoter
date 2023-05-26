import 'dart:async';
import 'dart:convert';

import 'package:events_app/Models/EventsModel.dart';
import 'package:events_app/Models/PromoterModel.dart';
import 'package:events_app/Repositories/IRepositoryEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../Models/CityModel.dart';
import 'LoginController.dart';
import 'ProfileController.dart';

class EventController extends GetxController with StateMixin {
  final IRepositoryParty _repositoryParty;
  EventController(this._repositoryParty);
  final RxList<EventModel> allEvents = RxList<EventModel>([]);
  final LoginController _loginController = Get.find();
  final city = ModelCity().obs;

  @override
  void onReady() async {
    //_loginController.logout();
    loadPromoterEvents();
    super.onReady();
  }

  final storage = GetStorage();
  final hourInputController = MaskedTextController(mask: '00:00');

  final _selectedDate = DateTime.now().obs;
  DateTime get selectedDate => _selectedDate.value;
  final _dateController = TextEditingController().obs;
  TextEditingController get dateController => _dateController.value;
  final ProfileController controller = Get.find();
  var eventsModelX = EventModel().obs;
  var promoterModel = PromoterModel().obs;

  var isLoading = false.obs;
  var errorMessage = "".obs;
  var title = "".obs;
  var errorLodMessage = "".obs;
  var bannerUrl = "".obs;
  var cityName = "".obs;
  var street = "".obs;
  var number = "".obs;
  var placeName = "".obs;
  var description = "".obs;
  var entrancePrice = 0.0.obs;
  var organizedBy = "".obs;
  var forAdultsOnly = true.obs;
  var startTime = "".obs;
  var endTime = "".obs;
  var paymentInfo = "".obs;
  Rx<DateTime>? created;
  Rx<DateTime>? updated;
  var promoter = "".obs;
  RxList<String>? likes;
  var likesCount = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  // void selectUser(UserModel user) {
  //   // adicione o usuário selecionado à lista de usuários selecionados
  //   selectedUsers.add(user);

  //   // limpe o campo de pesquisa e a lista de usuários filtrados
  //   searchText = '';
  //   filteredUsers.assignAll(users);
  // }

  bool validateHour(String hourStr) {
    try {
      DateFormat('H:mm').parseStrict(hourStr);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool validateDate(String dateStr) {
    try {
      DateFormat('dd-MM-yyyy').parseStrict(dateStr).toString();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> loadPromoterEvents() async {
    try {
      change(null, status: RxStatus.loading());
      List<EventModel> response = await _repositoryParty
          .getPromoterEvents(_loginController.promoter!.id!);
      update();
      if (response.isEmpty) {
        change([], status: RxStatus.empty());
        allEvents.clear();
        allEvents.value = [];
        return null;
      } else
        change(response, status: RxStatus.success());
      allEvents.assignAll(response);
      print("ALL YOURS EVENTS $response");
    } catch (error) {
      String errorMessage = 'Erro ao obter eventos do promotor';
      if (error is Exception) {
        errorMessage = error.toString();
      }
      // Trate a mensagem de erro e atualize a interface do usuário
      change([], status: RxStatus.error(errorMessage));
      print("-------$errorMessage");
      allEvents.clear();
      allEvents.value = [];
    }
  }

  Future<void> selecteDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _selectedDate.value = picked;
      _dateController.value.text = DateFormat('dd.MM.yyyy').format(picked);
    }
  }

  String get formatteddate => DateFormat('yyyy-MM-dd').format(selectedDate);
  Map<String, dynamic> get date => {'date': formatteddate};

  String get jsonDate => jsonEncode(date);

  ///FUNCAO PARTY
  Future<void> createParty() async {
    // var userId = storage.read<int>('userid');
    // var title = storage.read<String>('title');

    // isLoading.value = true;
    DateTime dateTime =
        DateTime.parse(DateTime.now().toLocal().toIso8601String());

    // Decodifica a string JSON em um mapa
    // Map<String, dynamic> decodeDate = jsonDecode(jsonDate);

    // Recupera a data do mapa usando a chave "date"
    //String dateString = decodeDate['date'];

    // DateTime partydate = DateTime.parse(dateString);
    eventsModelX.value = EventModel(
      title: title.value,
      placeName: placeName.value,
      description: description.value,
      cityName: cityName.value,
      //artists: ArtistsModel.,
      bannerUrl: bannerUrl.value,
      //country: cr,
      startDate: dateTime,
      startTime: startTime.value,
      endDate: dateTime,
      endTime: endTime.value,
      likesCount: likesCount.value,
      number: number.value,
      organizedBy: organizedBy.value,
      entrancePrice: entrancePrice.value,
      //country: ,
      //likes: ,
      cityId: city.value.id,
      paymentInfo: paymentInfo.value,
      //photoGallery: photo,
      promoter: promoter.value,
      street: street.value,
      created: dateTime,
      updated: dateTime,
    );
    await _repositoryParty.addEvent(eventsModelX.value);
    loadPromoterEvents();
    controller.loadEventsByPromoter();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    loadPromoterEvents();
    isLoading.value = false;
    update();
    print(isLoading.value);
  }
}
