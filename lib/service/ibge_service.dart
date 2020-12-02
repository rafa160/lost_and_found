import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:found_and_lost_app/helpers/api/api_routes_ibge.dart';
import 'package:found_and_lost_app/models/location/city.dart';
import 'package:found_and_lost_app/models/location/uf.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IbgeService {
  Dio dio = new Dio();

  Future<List<UF>> getUFList() async {
    // used to save in cache the UF list
    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('UF_LIST')) {
      final jsonList = json.decode(preferences.get('UF_LIST'));
      jsonList.map<UF>((json) => UF.fromJson(json)).toList()
        ..sort((UF a, UF b) =>
            a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }

    const endpoint = ApiRoutesIGBE.route;

    try {
      final response = await dio.get<List>(endpoint);

      preferences.setString('UF_LIST', json.encode(response.data));

      final ufList = response.data.map<UF>((json) => UF.fromJson(json)).toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      return ufList;
    } on DioError {
      return Future.error('Falha ao obter lista de estados');
    }
  }

  Future<List<City>> getCityListFromApi(UF uf) async {
    final String endpoint =
        '${ApiRoutesIGBE.route}${uf.id}${ApiRoutesIGBE.cities}';

    try {
      final response = await dio.get<List>(endpoint);
      final cityList = response.data.map<City>((e) => City.fromJson(e)).toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      return cityList;
    } on DioError {
      return Future.error('Falha ao receber cidades');
    }
  }
}
