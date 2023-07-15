import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart' as entity;
import 'package:swapi/sw_encyclopedia/domain/repository/planets_repository.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/api/datasource/dictionary_remote_datasource.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/db/datasource/dictionary_local_datasource.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/repository/mapper/planet_mapper.dart';

@Singleton(as: PlanetsRepository)
class PlanetsRepositoryImpl implements PlanetsRepository{
  final DictionaryLocalDatasource _local;
  final DictionaryRemoteDatasource _remote;

  const PlanetsRepositoryImpl(this._local, this._remote);

  @override
  Stream<List<entity.Planet>> search(String query) async* {
    final planetsLocal = await _local.searchPlanets(query);
    final favoritesSaved = <entity.Planet>[];
    final localIds = <int>{};
    for(final planet in planetsLocal){
      favoritesSaved.add(planet.toEntity());
      localIds.add(planet.id);
    }
    final localMapped = planetsLocal.map((e) => e.toEntity()).toList();
    yield localMapped;

    final remoteSearch = await _remote.searchPlanets(query);
    final planetsRemote = [
      for(final planet in remoteSearch)
        if(!localIds.contains(planet.id))
          planet.toEntity()
    ];

    yield localMapped + planetsRemote;

  }

  @override
  Future<void> removeFromFavorite(int id) =>
      _local.deletePlanetById(id);


  @override
  Future<void> setFavorite(entity.Planet planet) =>
      _local.savePlanet(planet.toDb());

  @override
  Future<List<entity.Planet>> getAll() async =>
      (await _local.getPlanets()).map((e) => e.toEntity()).toList();
}
