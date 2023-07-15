import 'package:swapi/sw_encyclopedia/infrastructure/db/model/db.dart';

abstract class DictionaryLocalDatasource{
  Future<List<People>> getPeoples();
  Future<List<Starship>> getStarships();
  Future<List<Planet>> getPlanets();
  Future<List<People>> searchPeople(String query);
  Future<List<Starship>> searchStarships(String query);
  Future<List<Planet>> searchPlanets(String query);
  Future<List<Film>> getFilmsByIds(List<int> ids);
  Future<void> deletePeopleById(int id);
  Future<void> deletePlanetById(int id);
  Future<void> deleteStarshipById(int id);
  Future<void> savePeople(People people);
  Future<void> savePlanet(Planet planet);
  Future<void> saveStarship(Starship starship);
  Future<void> saveFilm(Film film);
}
