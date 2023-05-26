import 'package:events_app/Models/EventsModel.dart';
import 'package:events_app/Repositories/IRepositoryProfile.dart';
import 'package:get/get.dart';

class RepositoryProfile implements IRepositoryProfile {
  final String baseUrl = "http://192.168.178.24:5000/api/Party";
  final GetConnect httpClient = GetConnect();
  @override
  Future<List<EventModel>> getEventsByPromoterId(String? id) async {
    final response = await httpClient.get(
      '$baseUrl/user-parties/$id',
      decoder: (body) {
        if (body is List) {
          print("Get Event By Promoter Id******$body");
          return body
              .map<EventModel>((item) => EventModel.fromJson(item))
              .toList();
        } else {
          throw Exception('A resposta da API não é uma lista');
        }
      },
    );
    if (response.isOk) {
      return response.body!;
    } else {
      throw Exception(
          'Erro ao buscar as festas do usuário: ${response.statusText}');
    }
  }
}
