import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/starship.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/starships_repository.dart';

@singleton
class SearchStarshipsUseCase {
  final StarshipsRepository _repo;

  SearchStarshipsUseCase(this._repo);

  Stream<List<Starship>> call(String param) => _repo.search(param);
}
