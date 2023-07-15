import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi/core/di/di.dart';
import 'package:swapi/sw_encyclopedia/application/cubit/search_body/search_cubit.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/widget_list_extension.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/item/people_item.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/item/planet_item.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/item/starship_item.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/nothin_found_stub.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/search_category_header.dart';


class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (_) => getIt<SearchCubit>(),
      child: const _SearchBody(),
    );
  }
}

class _SearchBody extends StatelessWidget {
  const _SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            final cubit = context.read<SearchCubit>();
            return Stack(
              children: [
                Positioned(
                  top: 32,
                  left: 16,
                  right: 16,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SearchBar(
                      hintText: 'Search',
                      onChanged: cubit.onSearch,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 96, 0, 0),
                  child: CustomScrollView(
                    slivers: [
                      const SizedBox(height: 40,),

                      SearchCategoryHeader(
                        title: 'People',
                        syncing: state.requestStatus.peopleRequesting,
                      ),
                      const SizedBox(height: 16,),
                      if(state.isPeopleEmpty)
                        const NothingFoundStub(),
                      ...[
                        for(final people in state.people)
                          PeopleItem(
                            people: people,
                            onFavoritePressed: () =>
                                cubit.changeFavoriteStatusPeople(people),
                          ),
                      ].divide(divider: _getDivider()),
                      const SizedBox(height: 40,),

                      SearchCategoryHeader(
                        title: 'Planets',
                        syncing: state.requestStatus.planetsRequesting,
                      ),
                      const SizedBox(height: 16,),
                      if(state.isPlanetEmpty)
                        const NothingFoundStub(),
                      ...[
                        for(final planet in state.planets)
                          PlanetItem(
                            planet: planet,
                            onFavoritePressed: () =>
                                cubit.changeFavoriteStatusPlanet(planet),
                          ),
                      ].divide(divider: _getDivider()),
                      const SizedBox(height: 40,),

                      SearchCategoryHeader(
                        title: 'Starship',
                        syncing: state.requestStatus.starshipsRequesting,
                      ),
                      const SizedBox(height: 16,),
                      if(state.isStarshipEmpty)
                        const NothingFoundStub(),
                      ...[
                        for(final starship in state.starships)
                          StarshipItem(
                            starship: starship,
                            onFavoritePressed: () =>
                                cubit.changeFavoriteStatusStarship(starship),
                          ),
                      ].divide(divider: _getDivider()),
                      const SizedBox(height: 32,),
                    ].packageToSliver(),
                  ),
                ),
              ],
            );
          },
      ),
    );
  }

  Widget _getDivider() => const Divider(endIndent: 16,);
}
