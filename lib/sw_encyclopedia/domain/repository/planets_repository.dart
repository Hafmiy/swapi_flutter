import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart';

abstract class PlanetsRepository{
  Stream<List<Planet>> search(String query);
  Future<List<Planet>> getAll();
  Future<void> setFavorite(Planet planet);
  Future<void> removeFromFavorite(int id);
}
