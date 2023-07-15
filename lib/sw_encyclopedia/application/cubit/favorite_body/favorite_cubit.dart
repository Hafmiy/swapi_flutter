import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/favorite/remove_favorite_people_usecase.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/favorite/remove_favorite_planet_usecase.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/favorite/remove_favorite_starship_usecase.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/get/get_favorite_people.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/get/get_favorite_planets.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/get/get_favorite_starships.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/get/get_films_by_ids_usecase.dart';

part 'favorite_cubit.freezed.dart';
part 'favorite_state.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState>{

  final GetFavoritePeopleUseCase _getFavoritePeopleUseCase;
  final GetFavoritePlanetUseCase _getFavoritePlanetUseCase;
  final GetFavoriteStarshipUseCase _getFavoriteStarshipUseCase;

  final RemoveFavoritePeopleUseCase _removeFavoritePeopleUseCase;
  final RemoveFavoritePlanetUseCase _removeFavoritePlanetUseCase;
  final RemoveFavoriteStarshipUseCase _removeFavoriteStarshipUseCase;

  final GetFilmsByIdsUseCase _getFilmsByIdsUseCase;

  FavoriteCubit(
      this._getFavoritePeopleUseCase,
      this._getFavoritePlanetUseCase,
      this._getFavoriteStarshipUseCase,
      this._getFilmsByIdsUseCase,
      this._removeFavoritePeopleUseCase,
      this._removeFavoritePlanetUseCase,
      this._removeFavoriteStarshipUseCase,
      ): super(FavoriteState.initial()) {
    _init();
  }

  Future _init() async {
    await _getFavorite();
    _getFilms();
  }

  Future<void> _getFavorite() async{
    await _getFavoritePeopleUseCase.call().then(
          (value) => emit(state.copyWith(people: value.lock)),
    );
    await _getFavoritePlanetUseCase.call().then(
          (value) => emit(state.copyWith(planets: value.lock)),
    );
    await _getFavoriteStarshipUseCase.call().then(
          (value) => emit(state.copyWith(starships: value.lock)),
    );
  }

  Future<void> _getFilms() async{
    final ids = {
      for(final people in state.people)
        ...people.films,
      for(final planet in state.planets)
        ...planet.films,
      for(final starship in state.starships)
        ...starship.films,
    };
    emit(state.copyWith(filmSyncing: true));
    final films = await _getFilmsByIdsUseCase.call(ids);
    emit(state.copyWith(
      filmSyncing: false,
      films: {
        for(final film in films)
          film.id : film
        },
    ),);
  }


  void removeFavoritePeople(int id){
    _removeFavoritePeopleUseCase.call(id);
    emit(state.copyWith(
      people: state.people.removeWhere(
            (e) => e.id == id,
      ),),);
  }

  void removeFavoritePlanet(int id){
    _removeFavoritePlanetUseCase.call(id);
    emit(state.copyWith(
      planets: state.planets.removeWhere(
            (e) => e.id == id,
      ),),);
  }

  void removeFavoriteStarship(int id){
    _removeFavoriteStarshipUseCase.call(id);
    emit(state.copyWith(
      starships: state.starships.removeWhere(
            (e) => e.id == id,
      ),),);
  }

}
