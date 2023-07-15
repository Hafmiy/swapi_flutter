import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/planet.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/planets_repository.dart';

@singleton
class SearchPlanetsUseCase {
  final PlanetsRepository _repo;

  SearchPlanetsUseCase(this._repo);

  Stream<List<Planet>> call(String param) => _repo.search(param);
}
