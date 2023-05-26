import 'package:events_app/Models/EventsModel.dart';
import 'package:events_app/Repositories/IRepositoryGeneralEvents.dart';
import 'package:get/get.dart';

class RepositoryGeneralEvents extends GetConnect
    implements IRepositoryGeneralEvents {
  String accessToken = "hJajlMk3NQp9ieGYRJXpCJGUErW9kRivjt7BxB82";
  @override
  void onInit() async {
    httpClient.baseUrl = "https://api.predicthq.com/v1";
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] = 'Bearer $accessToken';
      request.headers['Accept'] = 'application/json';

      return request;
    });
    super.onInit();
  }

  @override
  Future<List<EventModel>> getAllEvents() async {
    final response = await get("/events?limit=50&offset=10", query: {
      // "category": "concerts,community,festivals",
      // "country": "DE",
      // "location_around.origin": "51.45657,7.01228"
    });
    if (response.isOk) {
      final data = response.body as List;
      final events = data.map((json) => EventModel.fromJson(json)).toList();

      print("CORPO DA RESPOSTA EVENTS******$events");
      return events;
    } else {
      throw Exception('Failed to load events');
    }
  }

  @override
  Future<String> addEvents(String tblParty) async {
    return "";
  }

  @override
  Future<void> deleteEvents(String id) async {}

  @override
  Future<String> editEvents(String tblParty) async {
    return "";
  }

  @override
  Future<void> getEventsById(String id) async {}
}
