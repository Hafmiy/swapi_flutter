import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/entity.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/request_status.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/favorite/remove_favorite_people_usecase.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/favorite/remove_favorite_planet_usecase.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/favorite/remove_favorite_starship_usecase.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/favorite/set_favorite_people_usecase.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/favorite/set_favorite_planets_usecase.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/favorite/set_favorite_starships_usecase.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/search/search_people_usecase.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/search/search_planets_usecase.dart';
import 'package:swapi/sw_encyclopedia/domain/usecase/search/search_starships_usecase.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState>{

  static const _searchThreshold = 2;

  var _currentQuery = '';

  final SearchPeopleUseCase _searchPeopleUseCase;
  final SearchPlanetsUseCase _searchPlanetsUseCase;
  final SearchStarshipsUseCase _searchStarshipsUseCase;

  final SetFavoritePeopleUseCase _setFavoritePeopleUseCase;
  final SetFavoritePlanetsUseCase _setFavoritePlanetsUseCase;
  final SetFavoriteStarshipsUseCase _setFavoriteStarshipsUseCase;

  final RemoveFavoritePeopleUseCase _removeFavoritePeopleUseCase;
  final RemoveFavoritePlanetUseCase _removeFavoritePlanetUseCase;
  final RemoveFavoriteStarshipUseCase _removeFavoriteStarshipUseCase;
  StreamSubscription<List<People>>? _peopleSubscription;
  StreamSubscription<List<Planet>>? _planetsSubscription;
  StreamSubscription<List<Starship>>? _starshipsSubscription;

  SearchCubit(
      this._searchPeopleUseCase,
      this._searchPlanetsUseCase,
      this._searchStarshipsUseCase,
      this._setFavoritePeopleUseCase,
      this._setFavoritePlanetsUseCase,
      this._setFavoriteStarshipsUseCase,
      this._removeFavoritePeopleUseCase,
      this._removeFavoritePlanetUseCase,
      this._removeFavoriteStarshipUseCase,
      ): super(SearchState.initial());


  Future<void> onSearch(String query) async {
    _currentQuery = query;
    if(query.length < _searchThreshold){
       emit(SearchState.initial());
       return _cancelSubscriptions();
    } else {
      await _cancelSubscriptions();
    }
    emit(state.copyWith(requestStatus: RequestStatus.all()));
    _searchPeople(query);
    _searchPlanets(query);
    _searchStarships(query);
  }

  void changeFavoriteStatusPeople(People people){
    late People newPeople;
    if(people.favorite) {
      newPeople = people.copyWith(favorite: false);
      _removeFavoritePeopleUseCase.call(people.id);
    } else {
      newPeople = people.copyWith(favorite: true);
      _setFavoritePeopleUseCase.call(newPeople);
    }
    emit(state.copyWith(
      people: state.people.replaceFirstWhere(
            (e) => e.id == people.id,
            (e) => newPeople,
      ),),);
  }

  void changeFavoriteStatusPlanet(Planet planet){
    late Planet newPlanet;
    if(planet.favorite) {
      newPlanet = planet.copyWith(favorite: false);
      _removeFavoritePlanetUseCase.call(planet.id);
    } else {
      newPlanet = planet.copyWith(favorite: true);
      _setFavoritePlanetsUseCase.call(newPlanet);
    }
    emit(state.copyWith(
      planets: state.planets.replaceFirstWhere(
            (e) => e.id == planet.id,
            (e) => newPlanet,
      ),),);
  }

  void changeFavoriteStatusStarship(Starship starship){
    late Starship newStarship;
    if(starship.favorite) {
      newStarship = starship.copyWith(favorite: false);
      _removeFavoriteStarshipUseCase.call(starship.id);
    } else {
      newStarship = starship.copyWith(favorite: true);
      _setFavoriteStarshipsUseCase.call(newStarship);
    }
    emit(state.copyWith(
      starships: state.starships.replaceFirstWhere(
            (e) => e.id == starship.id,
            (e) => newStarship,
      ),),);
  }

  void _searchPeople(String query){
    _peopleSubscription = _searchPeopleUseCase.call(query).listen((people) {
      if(query != _currentQuery) return;
      final newPeople = {
        ...state.people.where((e) => e.fitSearch(query)),
        ...people
      }.toList()
        ..sort((a, b) => b.favorite.compareTo(a.favorite));
      emit(state.copyWith(people: newPeople.lock));
    },
    onDone: (){
      emit(
          state.copyWith(
              requestStatus: state.requestStatus.copyWith(peopleRequesting: false),
          ),
      );
    },);
  }

  void _searchPlanets(String query){
    _planetsSubscription = _searchPlanetsUseCase.call(query).listen((planets) {
      if(query != _currentQuery) return;
      final newPlanets = {
        ...state.planets.where((e) => e.fitSearch(query)),
        ...planets
      }.toList()
        ..sort((a, b) => b.favorite.compareTo(a.favorite));
      emit(state.copyWith(planets: newPlanets.lock));
    },
      onDone: (){
        emit(
          state.copyWith(
            requestStatus: state.requestStatus.copyWith(planetsRequesting: false),
          ),
        );
      },);
  }

  void _searchStarships(String query){
    _starshipsSubscription = _searchStarshipsUseCase.call(query).listen((starships) {
      if(query != _currentQuery) return;
      final newStarships = {
        ...state.starships.where((e) => e.fitSearch(query)),
        ...starships
      }.toList()
        ..sort((a, b) => b.favorite.compareTo(a.favorite));
      emit(state.copyWith(starships: newStarships.lock));
    },
      onDone: (){
        emit(
          state.copyWith(
            requestStatus: state.requestStatus.copyWith(starshipsRequesting: false),
          ),
        );
      },);
  }

  Future<void> _cancelSubscriptions() async {
    await _peopleSubscription?.cancel();
    await _planetsSubscription?.cancel();
    await _starshipsSubscription?.cancel();
  }
}
