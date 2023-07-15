import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart' as entity;
import 'package:swapi/sw_encyclopedia/domain/repository/starships_repository.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/api/datasource/dictionary_remote_datasource.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/db/datasource/dictionary_local_datasource.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/repository/mapper/starship_mapper.dart';

@Singleton(as: StarshipsRepository)
class StarshipsRepositoryImpl implements StarshipsRepository{
  final DictionaryLocalDatasource _local;
  final DictionaryRemoteDatasource _remote;

  const StarshipsRepositoryImpl(this._local, this._remote);

  @override
  Stream<List<entity.Starship>> search(String query) async* {
    final starshipsLocal = await _local.searchStarships(query);
    final favoritesSaved = <entity.Starship>[];
    final localIds = <int>{};
    for(final starship in starshipsLocal){
      favoritesSaved.add(starship.toEntity());
      localIds.add(starship.id);
    }
    final localMapped = starshipsLocal.map((e) => e.toEntity()).toList();
    yield localMapped;

    final remoteSearch = await _remote.searchStarships(query);
    final starshipsRemote = [
      for(final starship in remoteSearch)
        if(!localIds.contains(starship.id))
          starship.toEntity()
    ];

    yield localMapped + starshipsRemote;

  }

  @override
  Future<void> removeFromFavorite(int id) =>
      _local.deleteStarshipById(id);


  @override
  Future<void> setFavorite(entity.Starship starship) =>
      _local.saveStarship(starship.toDb());

  @override
  Future<List<entity.Starship>> getAll() async =>
      (await _local.getStarships()).map((e) => e.toEntity()).toList();
}
