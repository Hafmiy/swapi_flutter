import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/db/model/db.dart';

@module
abstract class RegisterModule {

  @preResolve
  @singleton
  Future<Isar> get db async =>
      Isar.open(
        [
          FilmSchema,
          PeopleSchema,
          PlanetSchema,
          StarshipSchema
        ],
        directory: (await getApplicationDocumentsDirectory()).path,
      );

  Dio get httpClient => Dio();
}
