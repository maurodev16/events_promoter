import 'package:events_app/Models/CityModel.dart';

abstract class IRepositoryCity {
  Future<List<ModelCity>> getAllCities();
  Future<void> getCityById(String id);
  Future<void> deleteCity(String id);
  Future<ModelCity> editCity(ModelCity tblCity);
  Future<ModelCity> addCity(ModelCity tblCity);
}
