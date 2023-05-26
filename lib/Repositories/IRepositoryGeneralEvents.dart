import 'package:events_app/Models/EventsModel.dart';

abstract class IRepositoryGeneralEvents {
  Future<List<EventModel>> getAllEvents();
  Future<void> getEventsById(String id);
  Future<void> deleteEvents(String id);
  Future<String> editEvents(String tblParty);
  Future<String> addEvents(String tblParty);
}
