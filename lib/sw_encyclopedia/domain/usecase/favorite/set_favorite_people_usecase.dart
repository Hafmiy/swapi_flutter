import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/people.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/people_repository.dart';

@singleton
class SetFavoritePeopleUseCase {
  final PeopleRepository _repo;

  const SetFavoritePeopleUseCase(this._repo);

  Future<void> call(People param) => _repo.setFavorite(param);
}
