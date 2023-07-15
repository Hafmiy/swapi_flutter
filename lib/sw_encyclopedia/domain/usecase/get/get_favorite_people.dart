import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/people.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/people_repository.dart';

@singleton
class GetFavoritePeopleUseCase {
  final PeopleRepository _repo;

  GetFavoritePeopleUseCase(this._repo);

  Future<List<People>> call() => _repo.getAll();
}
