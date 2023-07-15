import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/planets_repository.dart';

@singleton
class RemoveFavoritePlanetUseCase {
  final PlanetsRepository _repo;

  const RemoveFavoritePlanetUseCase(this._repo);

  Future<void> call(int param) => _repo.removeFromFavorite(param);
}
