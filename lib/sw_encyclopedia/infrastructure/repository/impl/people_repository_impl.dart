import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart' as entity;
import 'package:swapi/sw_encyclopedia/domain/repository/people_repository.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/api/datasource/dictionary_remote_datasource.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/db/datasource/dictionary_local_datasource.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/repository/mapper/people_mapper.dart';

@Singleton(as: PeopleRepository)
class PeopleRepositoryImpl implements PeopleRepository{
  final DictionaryLocalDatasource _local;
  final DictionaryRemoteDatasource _remote;

  const PeopleRepositoryImpl(this._local, this._remote);

  @override
  Stream<List<entity.People>> search(String query) async* {
    final peopleLocal = await _local.searchPeople(query);
    final favoritesSaved = <entity.People>[];
    final localIds = <int>{};
    for(final people in peopleLocal){
      favoritesSaved.add(people.toEntity());
      localIds.add(people.id);
    }
    final localMapped = peopleLocal.map((e) => e.toEntity()).toList();
    yield localMapped;

    final remoteSearch = await _remote.searchPeople(query);
    final peopleRemote = [
    for(final people in remoteSearch)
      if(!localIds.contains(people.id))
        people.toEntity()
    ];

    yield localMapped + peopleRemote;
  }

  @override
  Future<List<entity.People>> getAll() async =>
      (await _local.getPeoples()).map((e) => e.toEntity()).toList();

  @override
  Future<void> removeFromFavorite(int id) => _local.deletePeopleById(id);

  @override
  Future<void> setFavorite(entity.People people) => _local.savePeople(people.toDb());
}
