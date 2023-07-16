import 'package:flutter/material.dart';
import 'package:swapi/core/extension/string_extension.dart';
import 'package:swapi/sw_encyclopedia/domain/entity/people.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/context_extension.dart';

class PeopleItem extends StatelessWidget {
  final People people;
  final VoidCallback onFavoritePressed;
  const PeopleItem({super.key, required this.people, required this.onFavoritePressed});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Text(people.name, style: textTheme.titleMedium,),
      ),
      subtitle: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(people.gender.capitalize(), style: textTheme.bodyMedium,)),
        const SizedBox(
          width: 32,
        ),
        Expanded(child: Text('${context.l10n.categoryStarship}: ${people.starshipsQuantity}', style: textTheme.bodyMedium,),)
      ],
    ),
      trailing: IconButton(
        onPressed: onFavoritePressed,
        icon: Icon(
          people.favorite? Icons.star: Icons.star_outline,
          color: context.theme.colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
