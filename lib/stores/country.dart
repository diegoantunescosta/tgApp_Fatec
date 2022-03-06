import 'package:get_it/get_it.dart';
import 'package:flutter_social/utils/api.dart';
import 'package:flutter_social/models/city.dart';

final api = GetIt.I.get<API>();

class Country {
  Future<List<City>> getAll() async {
    dynamic response = await api.get('city');
    response = response.body;
  }

  Future<City> getById(int id) async {}
}
