import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/db/datasource/dictionary_local_datasource.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/db/model/db.dart';

@Singleton(as: DictionaryLocalDatasource)
class DictionaryLocalDatasourceImpl implements DictionaryLocalDatasource {

  final Isar _db;

  DictionaryLocalDatasourceImpl(this._db);

  @override
  Future<void> deletePeopleById(int id) =>
      _db.writeTxn(() => _db.peoples.delete(id));

  @override
  Future<void> deletePlanetById(int id) =>
      _db.writeTxn(() => _db.planets.delete(id));

  @override
  Future<void> deleteStarshipById(int id) =>
      _db.writeTxn(() => _db.starships.delete(id));

  @override
  Future<void> saveFilm(Film film) =>
      _db.writeTxn(() => _db.films.put(film));

  @override
  Future<void> savePeople(People people) =>
      _db.writeTxn(() => _db.peoples.put(people));

  @override
  Future<void> savePlanet(Planet planet) =>
      _db.writeTxn(() => _db.planets.put(planet));

  @override
  Future<void> saveStarship(Starship starship) =>
      _db.writeTxn(() => _db.starships.put(starship));

  @override
  Future<List<People>> searchPeople(String query) =>
      _db.peoples.filter()
          .nameContains(query, caseSensitive: false)
          .findAll();

  @override
  Future<List<Planet>> searchPlanets(String query) =>
      _db.planets.filter()
          .nameContains(query, caseSensitive: false)
          .findAll();

  @override
  Future<List<Starship>> searchStarships(String query) =>
      _db.starships.filter()
          .nameContains(query, caseSensitive: false)
          .findAll();

  @override
  Future<List<Film>> getFilmsByIds(List<int> ids) async =>
      (await _db.films.getAll(ids))
          .nonNulls
          .toList();

  @override
  Future<List<People>> getPeoples() =>
      _db.peoples.where().findAll();

  @override
  Future<List<Planet>> getPlanets() =>
      _db.planets.where().findAll();

  @override
  Future<List<Starship>> getStarships() =>
      _db.starships.where().findAll();
}
