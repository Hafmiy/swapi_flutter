import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/starship.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/starships_repository.dart';

@singleton
class GetFavoriteStarshipUseCase {
  final StarshipsRepository _repo;

  GetFavoriteStarshipUseCase(this._repo);

  Future<List<Starship>> call() => _repo.getAll();
}
