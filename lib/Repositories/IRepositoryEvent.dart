import 'package:events_app/Models/EventsModel.dart';

abstract class IRepositoryParty {
  Future<List<EventModel>> getPromoterEvents(String promoterId);
  Future<EventModel> addEvent(EventModel tblEvent);
  Future<void> getEventsById(String id);
  Future<void> deleteEvent(String id);
  Future<EventModel> editEvent(EventModel tblEvent);
}
