import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/planet.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/planets_repository.dart';

@singleton
class SetFavoritePlanetsUseCase {
  final PlanetsRepository _repo;

  const SetFavoritePlanetsUseCase(this._repo);

  Future<void> call(Planet param) => _repo.setFavorite(param);
}
