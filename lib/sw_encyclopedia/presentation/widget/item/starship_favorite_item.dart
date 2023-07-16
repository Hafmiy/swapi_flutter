import 'package:flutter/material.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/film.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/starship.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/context_extension.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/film_list.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/item/starship_item.dart';

class StarshipFavoriteItem extends StatelessWidget {
  final Starship starship;
  final List<Film> films;
  final bool filmSyncing;
  final VoidCallback onFavoritePressed;

  const StarshipFavoriteItem(
      {super.key, required this.starship, required this.onFavoritePressed, required this.films, required this.filmSyncing,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StarshipItem(
            starship: starship,
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
