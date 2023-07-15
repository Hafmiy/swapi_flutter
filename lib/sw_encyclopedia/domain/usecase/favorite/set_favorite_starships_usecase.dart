import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/starship.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/starships_repository.dart';

@singleton
class SetFavoriteStarshipsUseCase {
  final StarshipsRepository _repo;

  SetFavoriteStarshipsUseCase(this._repo);

  Future<void> call(Starship param) => _repo.setFavorite(param);
}
