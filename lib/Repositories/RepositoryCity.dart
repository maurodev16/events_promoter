import 'package:events_app/Repositories/IRepositoryCity.dart';
import 'package:get/get.dart';

import '../Models/CityModel.dart';

class RepositoryCity implements IRepositoryCity {
  final String baseUrl = "https://velhodalancha.onrender.com/api/v1";
  final GetConnect httpClient = GetConnect();

  @override
  Future<List<ModelCity>> getAllCities() async {
    final response = await httpClient.get(
      '$baseUrl/city/fetch',
      decoder: (body) {
        if (body is List) {
          return body
              .map<ModelCity>((item) => ModelCity.fromJson(item))
              .toList();
        }
        return null;
      },
    );
    if (response.hasError) {
      throw Exception('Erro ao buscar city');
    }
    return response.body!;
  }

  @override
  Future<ModelCity> addCity(ModelCity tblCity) async {
    final response = await httpClient.post(
        'adicionar aqui a url para add uma Cidade', tblCity.toJson());
    if (response.status.hasError) {
      throw response.statusText!;
    } else {
      final json = response.body as Map<String, dynamic>;
      final newCity = ModelCity.fromJson(json);
      return newCity;
    }
  }

  @override
  Future<ModelCity> editCity(ModelCity tblCity) async {
    final response = await httpClient.put(
        'url para EDITAR uma City/${tblCity.id}', tblCity.toJson());
    if (response.status.hasError) {
      throw response.statusText!;
    } else {
      final json = response.body as Map<String, dynamic>;
      final updateCity = ModelCity.fromJson(json);
      return updateCity;
    }
  }

  @override
  Future<void> getCityById(String id) async {
    final response = await httpClient.get('/cities/$id');
    if (response.status.hasError) {
      throw response.statusText!;
    }
  }

  @override
  Future<void> deleteCity(String id) async {
    final response = await httpClient.delete('/cities/$id');
    if (response.status.hasError) {
      throw response.statusText!;
    }
  }
}
