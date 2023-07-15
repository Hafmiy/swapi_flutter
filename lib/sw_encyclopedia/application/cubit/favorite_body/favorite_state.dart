part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState{

  const factory FavoriteState({
    required IList<Planet> planets,
    required IList<People> people,
    required IList<Starship> starships,
    required bool filmSyncing,
    required Map<int, Film> films,
  }) = _FavoriteState;

  factory FavoriteState.initial() =>
      FavoriteState(
          planets: IList(),
          people: IList(),
          starships: IList(),
          filmSyncing: false,
          films: {},
      );
}

extension FavoriteStateExtension on FavoriteState {
  bool get isPeopleEmpty => people.isEmpty;
  bool get isPlanetEmpty => people.isEmpty;
  bool get isStarshipEmpty => people.isEmpty;
}
