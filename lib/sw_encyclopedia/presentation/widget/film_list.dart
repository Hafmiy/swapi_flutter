import 'package:flutter/material.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/film.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/item/film_item.dart';

class FilmList extends StatelessWidget {
  final List<Film> films;

  const FilmList({super.key, required this.films});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/5,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => FilmItem(
          film: films[index],
        ),
        itemCount: films.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
      ),
    );
  }
}
