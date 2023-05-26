import 'dart:convert';
import 'package:events_app/Models/PromoterModel.dart';
import 'package:get/get_connect/connect.dart';

import 'IRepositoryPromoter.dart';

class RepositoryPromoter extends GetConnect implements IRepositoryPromoter {
  @override
  void onInit() {
    baseUrl = "https://velhodalancha.onrender.com/api/v1/promoter";
    super.onInit();
  }

  @override
  Future<PromoterModel> addPromoter(PromoterModel tblPromoter) async {
    final response = await post('/register', tblPromoter.toJson());
    if (response.isOk) {
      print("********Resposta do corpo PromoterModel****${response.body}");
      return PromoterModel.fromJson(response.body);
    } else {
      throw Exception({response.body});
    }
  }

  @override
  Future<List<String>> getPromotersByName(String name) async {
    final response = await get('/search_by_name?name=$name');
    final jsonData = (jsonDecode(response.body) as List)
        .map((json) => PromoterModel.fromJson(json))
        .toList();
    final promoters = jsonData.map((promoter) => promoter.name!).toList();
    print(promoters);
    if (response.isOk) {
      return Future.value(promoters);
    } else if (response.statusCode == 400) {
      throw Exception("promoter não encontrado.");
    } else {
      throw Exception("Erro ao buscar promoters.");
    }
  }

  @override
  Future<void> deletePromoter(String id) {
    throw UnimplementedError();
  }

  @override
  Future<PromoterModel> editPromoter(PromoterModel tblPromoter) {
    throw UnimplementedError();
  }

  @override
  Future<List<PromoterModel>> getAllPromoters() {
    throw UnimplementedError();
  }

  @override
  Future<void> getPromoterById(String id) {
    throw UnimplementedError();
  }
}
