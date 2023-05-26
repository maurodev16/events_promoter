import 'package:events_app/Models/CityModel.dart';
import 'package:events_app/Repositories/IRepositoryCity.dart';
import 'package:get/get.dart';

class CityController extends GetxController with StateMixin {
  final IRepositoryCity _repositoryCity;
  CityController(this._repositoryCity);
  var selectedCity;
  RxList<ModelCity> cities = <ModelCity>[].obs;
  RxList<ModelCity> filteredCities = <ModelCity>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCities();
  }

  Future<void> loadCities() async {
    change([], status: RxStatus.loading());
    try {
      final response = await _repositoryCity.getAllCities();
      cities.assignAll(response);
      change(cities, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('City not found'));
    }
  }

  void searchCity(String query) {
    // Limpar a lista "filteredCities" antes de adicionar as cidades filtradas
    filteredCities.clear();

    // Verificar se o valor de pesquisa está vazio
    if (query.isEmpty) {
      // Adicionar todas as cidades à lista filtrada
      filteredCities.addAll(cities);
    } else {
      // Filtrar as cidades com base no valor de pesquisa
      filteredCities.addAll(
        cities.where((city) =>
            city.cityName!.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }
}
