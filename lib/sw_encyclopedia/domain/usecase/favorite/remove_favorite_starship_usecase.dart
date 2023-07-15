import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/starships_repository.dart';

@singleton
class RemoveFavoriteStarshipUseCase {
  final StarshipsRepository _repo;

  const RemoveFavoriteStarshipUseCase(this._repo);

  Future<void> call(int param) => _repo.removeFromFavorite(param);
}
