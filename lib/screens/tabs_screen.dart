import 'package:flutter/material.dart';
import 'package:multipageapp/screens/categories_screen.dart';
import 'package:multipageapp/screens/favorites_sreen.dart';
import 'package:multipageapp/widgets/maindrawer.dart';
import 'package:multipageapp/models/meal.dart';
class TabScreen extends StatefulWidget {
  
  final List<Meal> favoriteMeals;
  
  TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  late List<Map<String, dynamic>> _screens ;

  @override
  void initState() {
    _screens = [
        {'page': CategoriesScreen(), 'title': 'Category'},
        {'page': FavoritesSreen(widget.favoriteMeals), 'title': 'Favorites'},
        {'page': Center(child: Text('Add Meal')), 'title': 'Add meal'},
        {'page': Center(child: Text('settings')),'title': 'Settings',
        }, // You can replace this later
      ];

    super.initState();
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedIndex]['title'],

        ),
      ),
      drawer: Drawer(backgroundColor: Colors.white, child: MainDrawer()),
      body: _screens[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,

        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.category, 0),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.favorite, 1),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.add, 2),
            label: 'Add meal',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.settings, 3),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData iconData, int index) {
    return GestureDetector(
      onTap: () {
        _onTabTapped(index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.black26 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Icon(iconData),
      ),
    );
  }
}
