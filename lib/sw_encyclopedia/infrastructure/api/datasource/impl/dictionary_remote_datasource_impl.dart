// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:swapi/core/di/config_module.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/api/datasource/dictionary_remote_datasource.dart';
import 'package:swapi/sw_encyclopedia/infrastructure/api/model/model.dart';

@Singleton(as: DictionaryRemoteDatasource)
class DictionaryRemoteDatasourceImpl implements DictionaryRemoteDatasource{
  final Dio client;
  final String apiUrl;
  static const _filmPath = 'films';
  static const _peoplePath = 'people';
  static const _planetPath = 'planets';
  static const _starshipPath = 'starships';
  static const _searchParam = 'search';

  DictionaryRemoteDatasourceImpl(this.client, @Named(apiUrlKey) this.apiUrl);

  @override
  Future<List<People>> searchPeople(String query) async {
    final response = await client.get(
      '$apiUrl/$_peoplePath',
      queryParameters: {_searchParam: query},
    );
    return compute((peoples) =>
        (peoples as List<dynamic>).map((e) => People.fromJson(e)).toList(),
        response.data['results'],
    );
  }

  @override
  Future<List<Planet>> searchPlanets(String query) async {
    final response = await client.get(
      '$apiUrl/$_planetPath',
      queryParameters: {_searchParam: query},
    );
    return compute((planets) =>
        (planets as List<dynamic>).map((e) => Planet.fromJson(e)).toList(),
      response.data['results'],
    );
  }

  @override
  Future<List<Starship>> searchStarships(String query) async {
    final response = await client.get(
        '$apiUrl/$_starshipPath',
        queryParameters: {_searchParam: query},
    );
    return compute((ships) =>
        (ships as List<dynamic>).map((e) => Starship.fromJson(e)).toList(),
      response.data['results'],
    );
  }

  @override
  Future<Film?> getFilmById(int id) async {
    final response = await client.get('$apiUrl/$_filmPath/$id');
    return compute((film) => Film.fromJson(film), response.data);
  }

}
