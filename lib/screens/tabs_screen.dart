import 'package:flutter/material.dart';
import 'package:multipageapp/screens/categories_screen.dart';
import 'package:multipageapp/screens/favorites_sreen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs:  <Widget>[
            Tab(icon: Icon(Icons.category), text: 'Categores'),
            Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
          ],
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavoritesSreen()
        ]),
      ),
    );
  }
}
