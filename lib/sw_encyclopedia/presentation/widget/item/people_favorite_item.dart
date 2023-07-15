import 'package:flutter/material.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/film.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/people.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/theme_context_extension.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/film_list.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/item/people_item.dart';

class PeopleFavoriteItem extends StatelessWidget {
  final People people;
  final List<Film> films;
  final bool filmSyncing;
  final VoidCallback onFavoritePressed;

  const PeopleFavoriteItem(
      {super.key, required this.people, required this.onFavoritePressed, required this.films, required this.filmSyncing,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PeopleItem(
            people: people,
            onFavoritePressed: onFavoritePressed,
        ),
        const SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text('Filmography', style: context.textTheme.titleMedium,),
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
          child: Text('No films found', style: context.textTheme.titleMedium,),
        );
      }
    }
  }
}
