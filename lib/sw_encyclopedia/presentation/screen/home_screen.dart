import 'package:flutter/material.dart';
import 'package:swapi/sw_encyclopedia/presentation/screen/favorite_body.dart';
import 'package:swapi/sw_encyclopedia/presentation/screen/search_body.dart';

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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
        selectedIndex: pageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.star),
            icon: Icon(Icons.star_outline),
            label: 'Favorite',
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
