import 'package:events_app/Models/EventsModel.dart';

abstract class IRepositoryProfile {
  Future<List<EventModel>> getEventsByPromoterId(String? id);
}
