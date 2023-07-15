import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/film.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/films_repository.dart';

@singleton
class GetFilmsByIdsUseCase {
  final FilmsRepository _repo;

  GetFilmsByIdsUseCase(this._repo);

  Future<List<Film>> call(Set<int> param) => _repo.getByIds(param);
}
