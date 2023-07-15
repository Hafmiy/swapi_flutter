import 'package:flutter/material.dart';
import 'package:swapi/core/extension/string_extension.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/starship.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/theme_context_extension.dart';

class StarshipItem extends StatelessWidget {
  final Starship starship;
  final VoidCallback onFavoritePressed;

  const StarshipItem(
      {super.key, required this.starship, required this.onFavoritePressed,});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                starship.name,
                style: textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: Text(
                starship.model,
                style: textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              starship.manufacturer.capitalize(),
              style: textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            width: 32,
          ),
          Expanded(
            child: Text(
              'Passangers: ${starship.passengers}',
              style: textTheme.bodyMedium,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: onFavoritePressed,
        icon: Icon(
          starship.favorite ? Icons.star : Icons.star_outline,
          color: context.theme.colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
