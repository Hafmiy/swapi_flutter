import 'package:flutter/material.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/context_extension.dart';

class NothingFoundStub extends StatelessWidget {
  const NothingFoundStub({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.search_off_outlined, size: 48,),
          Text(context.l10n.favoriteBodyEmptySearchStub, style: context.textTheme.titleLarge,)
        ],
      ),
    );
  }
}
