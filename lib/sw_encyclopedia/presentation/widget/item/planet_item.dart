import 'package:flutter/material.dart';
import 'package:swapi/core/extension/string_extension.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/planet.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/theme_context_extension.dart';

class PlanetItem extends StatelessWidget {
  final Planet planet;
  final VoidCallback onFavoritePressed;

  const PlanetItem(
      {super.key, required this.planet, required this.onFavoritePressed,});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Text(
          planet.name,
          style: textTheme.titleMedium,
        ),
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Diameter: ${planet.diameter.capitalize()}',
              style: textTheme.bodyMedium,
            ),
          ),
          const SizedBox(width: 32,),
          Expanded(
            child: Text(
              'Population: ${planet.population}',
              style: textTheme.bodyMedium,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: onFavoritePressed,
        icon: Icon(
          planet.favorite ? Icons.star : Icons.star_outline,
          color: context.theme.colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
