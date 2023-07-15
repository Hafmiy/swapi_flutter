import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/people.dart';
import 'package:swapi/sw_encyclopedia/domain/repository/people_repository.dart';

@singleton
class SearchPeopleUseCase {
  final PeopleRepository _repo;

  SearchPeopleUseCase(this._repo);

  Stream<List<People>> call(String param) => _repo.search(param);
}
