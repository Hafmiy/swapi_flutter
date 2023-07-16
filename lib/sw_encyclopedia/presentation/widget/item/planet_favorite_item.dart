import 'package:flutter/material.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/film.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/planet.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/context_extension.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/film_list.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/item/planet_item.dart';

class PlanetFavoriteItem extends StatelessWidget {
  final Planet planet;
  final List<Film> films;
  final bool filmSyncing;
  final VoidCallback onFavoritePressed;

  const PlanetFavoriteItem(
      {super.key, required this.planet, required this.onFavoritePressed, required this.films, required this.filmSyncing,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlanetItem(
            planet: planet,
            onFavoritePressed: onFavoritePressed,
        ),
        const SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(context.l10n.favoriteBodyFilmographyTitle, style: context.textTheme.titleMedium,),
        ),
        Center(child: _getFilmography(context))
      ],
    );
  }

  Widget _getFilmography(BuildContext context){
    if(filmSyncing) {
      return const SizedBox(
          width: 48,
          height: 48,
          child: CircularProgressIndicator(
            strokeWidth: 8,
          ),
      );
    } else {
      if(films.isNotEmpty) {
        return FilmList(films: films);
      } else {
        return Center(
          child: Text(context.l10n.favoriteBodyEmptyFilmsStub, style: context.textTheme.titleMedium,),
        );
      }
    }
  }
}
