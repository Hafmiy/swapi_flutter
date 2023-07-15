import 'package:injectable/injectable.dart';
import 'package:swapi/core/extension/let.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart' as entity;
import 'package:swapi/sw_encyclopedia/domain/repository/films_repository.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/api/datasource/dictionary_remote_datasource.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/api/model/model.dart' as swapi;
import 'package:swapi/sw_encyclopedia/infrastructure/db/datasource/dictionary_local_datasource.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/repository/mapper/film_mapper.dart';

@Singleton(as: FilmsRepository)
class FilmsRepositoryImpl implements FilmsRepository{
  final DictionaryLocalDatasource _local;
  final DictionaryRemoteDatasource _remote;

  const FilmsRepositoryImpl(this._local, this._remote);

  @override
  Future<List<entity.Film>> getByIds(Set<int> ids) async {
    final localFilms = (await _local.getFilmsByIds(ids.toList())).map((e) => e.toEntity()).toList();
    if(localFilms.length == ids.length) {
      return localFilms;
    } else {
      final notLoadedFilms = ids.difference(localFilms.map((e) => e.id).toSet());
      final remoteFilms = <entity.Film>[];
      for(final id in notLoadedFilms) {
        (await _remote.getFilmById(id)).let((e) {
          remoteFilms.add(e.toEntity());
          saveFilm(e);
        });
      }
      return localFilms + remoteFilms;
    }
  }

  Future<void> saveFilm(swapi.Film film) =>
      _local.saveFilm(film.toDb());
}
