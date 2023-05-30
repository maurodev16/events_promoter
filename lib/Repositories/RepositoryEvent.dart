import 'package:events_app/Models/EventsModel.dart';
import 'package:get/get.dart';

import 'IRepositoryEvent.dart';

class RepositoryParty implements IRepositoryParty {
  final String baseUrl = "https://velhodalancha.onrender.com/api/v1/event";
  final GetConnect httpClient = GetConnect();

  @override
  Future<EventModel> addEvent(EventModel tblEvent) async {
    final response =
        await httpClient.post('$baseUrl/create', tblEvent.toJson());

    if (response.isOk) {
      print("********Resposta do corpo  ModelEvent****${response.body}");

      return EventModel.fromJson(response.body);
    } else {
      print(
          "********Resposta do corpo Com eerrooo ModelEvent****${response.body}");

      throw Exception({response.body});
    }
  }

  @override
  Future<List<EventModel>> getPromoterEvents(String promoterId) async {
    // try {
    final response = await httpClient.get(
      '$baseUrl/fetchEventByPromoter/$promoterId',
      decoder: (body) {
        if (body is List) {
          print('RESPOSTA****: $body');
          return body
              .map<EventModel>((item) => EventModel.fromJson(item))
              .toList();
        } else {
          throw Exception('A resposta da API não é uma lista');
        }
      },
    );
    if (response.isOk) {
      return response.body!.cast<EventModel>();
    } else {
      throw Exception('Erro ao buscar os eventos');
    }
    // } catch (error) {
    //   print('REPOSITORY ERROR: $error');
    //   throw Exception(error);
    // }
  }

  @override
  Future<EventModel> editEvent(EventModel tblEvent) async {
    final response = await httpClient.put(
        'url para EDITAR uma Party/${tblEvent.id}', tblEvent.toJson());
    if (response.status.hasError) {
      throw response.statusText!;
    } else {
      final json = response.body as Map<String, dynamic>;
      final updateParty = EventModel.fromJson(json);
      return updateParty;
    }
  }

  @override
  Future<void> getEventsById(String id) async {
    final response = await httpClient.get('/parties/$id');
    if (response.status.hasError) {
      throw response.statusText!;
    }
  }

  @override
  Future<void> deleteEvent(String id) async {
    final response = await httpClient.delete('/parties/$id');
    if (response.status.hasError) {
      throw response.statusText!;
    }
  }
}
