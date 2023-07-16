import 'package:flutter/material.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/film.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/context_extension.dart';

class FilmItem extends StatelessWidget {
  final Film film;

  const FilmItem({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    film.title,
                    style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700,),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8,),
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: '${context.l10n.filmItemProduce}: ',
                              style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: film.producer,
                            style: textTheme.titleSmall,
                          ),
                        ],
                    ),
                ),
                const SizedBox(height: 4,),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${context.l10n.filmItemDirector}: ',
                        style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: film.director,
                        style: textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
