import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi/core/di/di.dart';
import 'package:swapi/sw_encyclopedia/application/cubit/favorite_body/favorite_cubit.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/theme_context_extension.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/widget_list_extension.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/item/people_favorite_item.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/item/planet_favorite_item.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/item/starship_favorite_item.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/no_favorites_stub.dart';


class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteCubit>(
      create: (_) => getIt<FavoriteCubit>(),
      child: const _FavoriteBody(),
    );
  }
}

class _FavoriteBody extends StatelessWidget {
  const _FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return SafeArea(
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            final cubit = context.read<FavoriteCubit>();
            return Padding(
              padding: const EdgeInsets.all(16),
              child: CustomScrollView(
                slivers: [
                  const SizedBox(height: 40,),

                  Text('People', style: textTheme.titleLarge,),
                  const SizedBox(height: 16,),
                  if(state.isPeopleEmpty)
                    const NoFavoritesStub(),
                  ...[
                    for(final people in state.people)
                      PeopleFavoriteItem(
                          people: people,
                          films: people.films.map((e) => state.films[e]).nonNulls.toList(),
                          filmSyncing: state.filmSyncing,
                          onFavoritePressed: () => cubit.removeFavoritePeople(people.id),
                      ),
                  ].divide(divider: _getDivider()),
                  const SizedBox(height: 40,),

                  Text('Planet', style: textTheme.titleLarge,),
                  if(state.isPeopleEmpty)
                    const NoFavoritesStub(),
                  const SizedBox(height: 16,),
                  ...[
                    for(final planet in state.planets)
                      PlanetFavoriteItem(
                        planet: planet,
                        films: planet.films.map((e) => state.films[e]).nonNulls.toList(),
                        filmSyncing: state.filmSyncing,
                        onFavoritePressed: () => cubit.removeFavoritePlanet(planet.id),
                      ),
                  ].divide(divider: _getDivider()),
                  const SizedBox(height: 40,),

                  Text('Starship', style: textTheme.titleLarge,),
                  const SizedBox(height: 16,),
                  if(state.isPeopleEmpty)
                    const NoFavoritesStub(),
                  ...[
                    for(final starship in state.starships)
                      StarshipFavoriteItem(
                        starship: starship,
                        films: starship.films.map((e) => state.films[e]).nonNulls.toList(),
                        filmSyncing: state.filmSyncing,
                        onFavoritePressed: () => cubit.removeFavoriteStarship(starship.id),
                      ),
                  ].divide(divider: _getDivider()),
                  const SizedBox(height: 40,),

                ].packageToSliver(),
              ),
            );
          },
      ),
    );
  }


  Widget _getDivider() => const Divider(endIndent: 16, height: 16,);
}
