import 'package:flutter/material.dart';
import 'package:swapi/sw_encyclopedia/presentation/extension/context_extension.dart';
import 'package:swapi/sw_encyclopedia/presentation/screen/favorite_body.dart';
import 'package:swapi/sw_encyclopedia/presentation/screen/search_body.dart';
import 'package:swapi/sw_encyclopedia/presentation/widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget {

  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
        selectedIndex: pageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: const Icon(Icons.search),
            icon: const Icon(Icons.search_outlined),
            label: context.l10n.homeScreenSearchTabLabel,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.star),
            icon: const Icon(Icons.star_outline),
            label: context.l10n.homeScreenFavoriteTabLabel,
          ),
        ],
      ),
      body: const [
        SearchBody(),
        FavoriteBody(),
      ][pageIndex],
    );
  }
}
