import 'package:flutter/material.dart';
import 'package:multipageapp/screens/categories_screen.dart';
import 'package:multipageapp/screens/favorites_sreen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    CategoriesScreen(),
    FavoritesSreen(),
    Center(child: Text('Add Meal')), 
    Center(child: Text('settings'),)// You can replace this later
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed, 
      currentIndex: _selectedIndex,
      onTap: _onTabTapped,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
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
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
        child: Icon(iconData),
      ),
    );
  }
}
