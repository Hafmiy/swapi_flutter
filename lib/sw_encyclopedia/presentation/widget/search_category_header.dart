import 'package:flutter/material.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/theme_context_extension.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/load_indicator.dart';

class SearchCategoryHeader extends StatelessWidget {
  final String title;
  final bool syncing;
  const SearchCategoryHeader({super.key, required this.title, required this.syncing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        children: [
          Text(title, style: context.textTheme.titleLarge,),
          const Spacer(),
          if(syncing)
           const LoadIndicator(),
        ],
      ),
    );
  }
}
