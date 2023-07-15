import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/people_repository.dart';

@singleton
class RemoveFavoritePeopleUseCase {
  final PeopleRepository _repo;

  const RemoveFavoritePeopleUseCase(this._repo);

  Future<void> call(int param) => _repo.removeFromFavorite(param);
}
