import 'package:flutter/material.dart';

import '../../Models/CityModel.dart';

class CitySearchDelegate extends SearchDelegate<String> {
  final List<ModelCity> cities;

  CitySearchDelegate({required this.cities});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Lógica para exibir os resultados da pesquisa
    // Aqui você pode exibir uma lista de cidades correspondentes ao valor de pesquisa
    final filteredCities = cities
        .where((city) =>
            city.cityName!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredCities.length,
      itemBuilder: (context, index) {
        final city = filteredCities[index];
        return ListTile(
          title: Text(city.cityName!),
          onTap: () {
            close(context, city.cityName!);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Lógica para exibir sugestões de pesquisa
    final filteredCities = cities
        .where((city) =>
            city.cityName!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredCities.length,
      itemBuilder: (context, index) {
        final city = filteredCities[index];
        return ListTile(
          title: Text(city.cityName!),
          subtitle: Text(city.capital!),
          onTap: () {
            query = city.cityName!;
            close(context, city.cityName!);
          },
        );
      },
    );
  }
}
