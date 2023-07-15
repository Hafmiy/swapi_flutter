import 'package:flutter/material.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/theme_context_extension.dart';

class NoFavoritesStub extends StatelessWidget {
  const NoFavoritesStub({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.star_outline, size: 48,),
          Text('No favorites yet', style: context.textTheme.titleLarge,)
        ],
      ),
    );
  }
}
