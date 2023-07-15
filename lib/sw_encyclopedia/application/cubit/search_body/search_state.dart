part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState{

  const factory SearchState({
    required IList<Planet> planets,
    required IList<People> people,
    required IList<Starship> starships,
    required RequestStatus requestStatus,
  }) = _SearchState;

  factory SearchState.initial() =>
      SearchState(
          planets: IList(),
          people: IList(),
          starships: IList(), requestStatus: RequestStatus.none(),
      );
}

extension SearchStateExtension on SearchState {
  bool get isPeopleEmpty => people.isEmpty && !requestStatus.peopleRequesting;
  bool get isPlanetEmpty => people.isEmpty && !requestStatus.planetsRequesting;
  bool get isStarshipEmpty => people.isEmpty && !requestStatus.starshipsRequesting;
}
