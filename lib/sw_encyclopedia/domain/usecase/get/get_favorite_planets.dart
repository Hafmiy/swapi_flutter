import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/planet.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/planets_repository.dart';

@singleton
class GetFavoritePlanetUseCase {
  final PlanetsRepository _repo;

  GetFavoritePlanetUseCase(this._repo);

  Future<List<Planet>> call() => _repo.getAll();
}
