import 'package:swapi/sw_encyclopedia/infrastructure/api/model/model.dart';

abstract class DictionaryRemoteDatasource{
  Future<List<People>> searchPeople(String query);
  Future<List<Starship>> searchStarships(String query);
  Future<List<Planet>> searchPlanets(String query);
  Future<Film?> getFilmById(int id);
}
